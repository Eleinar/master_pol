from PySide6.QtWidgets import (QDialog, QVBoxLayout, QHBoxLayout, QLabel, QLineEdit, QComboBox, QPushButton, QMessageBox)
from PySide6.QtGui import QFont, QIcon
import modules

class AddPartnerWindow(QDialog):
    def __init__(self, db_session, parent=None):
        super(AddPartnerWindow, self).__init__(parent)
        self.setWindowTitle("Новый партнёр")
        self.setWindowIcon(QIcon("master_pol/logo.png"))
        self.setGeometry(300, 200, 400, 500)
        self.setStyleSheet("background-color: white")
        
        self.db_session = db_session
        
        # Основной макет
        layout = QVBoxLayout(self)
        
        # Поля ввода
        self.company_name_input = QLineEdit()
        self.type_input = QComboBox()
        self.rating_input = QLineEdit()
        self.address_input = QLineEdit()
        self.director_input = QLineEdit()
        self.phone_input = QLineEdit()
        self.email_input = QLineEdit()

        # Заполнение выпадающего списка типов компаний
        company_types = self.db_session.query(modules.CompanyType).all()
        for company_type in company_types:
            self.type_input.addItem(company_type.company_type, company_type.id)

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
        # Получение данных из полей ввода
        try:
            company_name = self.company_name_input.text()
            type_id = self.type_input.currentData()
            rating = int(self.rating_input.text())
            address = self.address_input.text()
            director = self.director_input.text()
            phone = self.phone_input.text()
            email = self.email_input.text()
        except Exception as e:
            self.db_session.rollback()
            QMessageBox.critical(self, "Ошибка", f"Введены некорректные занчения: {e}")
            return
        # Создание записи для нового партнёра
        try:
            new_partner = modules.Partners(
                company_name=company_name,
                type_id=type_id,
                rating=rating,
                legal_address=address,
                director_name=director,
                phone=phone,
                email=email
            )
        except Exception as e:
            self.db_session.rollback()
            QMessageBox.critical(self, "Ошибка", f"Введены некорректные занчения: {e}")
            return
        # Добавление и сохранение записи в базе данных
        try:
            self.db_session.add(new_partner)
            self.db_session.commit()
            QMessageBox.information(self, "Успешно", "Партнёр добавлен!")
            self.accept()
        except Exception as e:
            self.db_session.rollback()
            QMessageBox.critical(self, "Ошибка", f"Не удалось добавить партнёра: {e}")
