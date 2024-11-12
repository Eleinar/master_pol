from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QLabel, QLineEdit, QComboBox, QPushButton, QMessageBox)
from PySide6.QtGui import QFont, QIcon
import modules

class EditPartnerWindow(QDialog):
    def __init__(self, db_session, partner_id, parent=None):
        super(EditPartnerWindow, self).__init__(parent)
        self.setWindowTitle("Редактирование партнёра")
        self.setWindowIcon(QIcon("master_pol/logo.png"))
        self.setGeometry(300, 200, 400, 500)
        self.setStyleSheet("background-color: white")
        
        self.db_session = db_session
        self.partner_id = partner_id

        # Загрузка данных партнёра
        self.partner = self.db_session.query(modules.Partners).get(self.partner_id)
        
        # Основной макет
        layout = QVBoxLayout(self)
        
        # Поля ввода
        self.company_name_input = QLineEdit(self.partner.company_name)
        self.type_input = QComboBox()
        self.rating_input = QLineEdit(str(self.partner.rating))
        self.address_input = QLineEdit(self.partner.legal_address)
        self.director_input = QLineEdit(self.partner.director_name)
        self.phone_input = QLineEdit(self.partner.phone)
        self.email_input = QLineEdit(self.partner.email)

        # Заполнение выпадающего списка типов компаний
        company_types = self.db_session.query(modules.CompanyType).all()
        for company_type in company_types:
            self.type_input.addItem(company_type.company_type, company_type.id)
            # Устанавливаем текущий тип компании
            if company_type.id == self.partner.type_id:
                self.type_input.setCurrentText(company_type.company_type)

        # Добавляем метки и поля в макет
        fields = [
            ("Наименование", self.company_name_input),
            ("Тип", self.type_input),
            ("Рейтинг", self.rating_input),
            ("Адрес", self.address_input),
            ("ФИО Директора", self.director_input),
            ("Телефон", self.phone_input),
            ("E-mail", self.email_input)
        ]
        
        for label_text, widget in fields:
            label = QLabel(label_text)
            label.setFont(QFont("Segoe UI", 10, QFont.Bold))
            widget.setStyleSheet("background-color: #F4E8D3;")
            layout.addWidget(label)
            layout.addWidget(widget)
        
        # Кнопки сохранения и отмены
        button_layout = QHBoxLayout()
        save_button = QPushButton("Сохранить")
        cancel_button = QPushButton("Отмена")
        
        save_button.clicked.connect(self.save_partner)
        cancel_button.clicked.connect(self.reject)
        
        for button in [save_button, cancel_button]:
            button.setFixedHeight(40)
            button.setStyleSheet("background-color: #67BA80")
            button.setStyleSheet("background-color: #67BA80; color: white; font-weight: bold")
        
        button_layout.addWidget(save_button)
        button_layout.addWidget(cancel_button)
        
        layout.addLayout(button_layout)

    def save_partner(self):
        # Обновление данных партнёра из полей ввода
        try:
            self.partner.company_name = self.company_name_input.text()
            self.partner.type_id = self.type_input.currentData()
            self.partner.rating = int(self.rating_input.text())
            self.partner.legal_address = self.address_input.text()
            self.partner.director_name = self.director_input.text()
            self.partner.phone = self.phone_input.text()
            self.partner.email = self.email_input.text()
        except Exception as e:
            self.db_session.rollback()
            QMessageBox.critical(self, "Ошибка", f"Введены некорректные занчения: {e}")
            return

        # Сохранение изменений в базе данных
        try:
            self.db_session.commit()
            QMessageBox.information(self, "Успешно", "Данные партнёра обновлены!")
            self.accept()
        except Exception as e:
            self.db_session.rollback()
            QMessageBox.critical(self, "Ошибка", f"Не удалось обновить данные партнёра: {e}")

