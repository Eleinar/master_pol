from PySide6.QtCore import Qt
from PySide6.QtWidgets import (QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QScrollArea, QFrame, QLabel, QDialog, QMessageBox)
from PySide6.QtGui import QFont, QIcon, QPixmap

from sales_history_window import SalesHistoryWindow
from sqlalchemy import func
import sys


import modules
from add_partner_window import AddPartnerWindow
from edit_partner_window import EditPartnerWindow

class PartnerWindow(QMainWindow):
    def __init__(self):
        super(PartnerWindow, self).__init__()
        self.setWindowTitle("Список партнёров")
        self.setWindowIcon(QIcon("master_pol/logo.png"))
        self.setGeometry(100, 100, 800, 600)
        self.setStyleSheet("background-color: white")
        
        # Подключение к базе данных
        try:
            self.db = modules.create_connection()
        except Exception as e:
            msg = QMessageBox.critical(self, "Ошибка", f"Не удалось подключиться к базе: {e}")
            sys.exit()
        
        # Основной виджет
        main_widget = QWidget()
        main_layout = QHBoxLayout(main_widget)
        
        # Левое меню с кнопками
        menu_widget = QWidget()
        menu_layout = QVBoxLayout(menu_widget)
        menu_layout.setSpacing(10)
        
        new_partner_button = QPushButton("Новый партнёр")
        new_partner_button.clicked.connect(self.onClickAddPartner)
        history_button = QPushButton("История реализации")
        history_button.clicked.connect(self.onClickHistory)
        partner_list_button = QPushButton("Список партнёров")

        for button in [new_partner_button, history_button, partner_list_button]:
            button.setFixedWidth(140)
            button.setFixedHeight(40)
            button.setStyleSheet("background-color: #67BA80; color: white; font-weight: bold")
            
        logo_label = QLabel()
        logo = QPixmap("master_pol/logo.png")
        logo_label.setPixmap(logo.scaled(100,100,Qt.KeepAspectRatio))
        logo_label.setAlignment(Qt.AlignLeft)
        
        menu_layout.addWidget(logo_label)
        menu_layout.addWidget(new_partner_button)
        menu_layout.addWidget(history_button)
        menu_layout.addWidget(partner_list_button)
        menu_layout.addStretch(1)
        
        # Прокручиваемый список партнёров
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        
        self.card_container = QWidget()
        
        self.card_layout = QVBoxLayout(self.card_container)
        self.card_layout.setAlignment(Qt.AlignTop | Qt.AlignHCenter)
        # Загрузка карточек партнёров
        self.loadPartnerCards()
        
        self.card_container.setLayout(self.card_layout)
        scroll_area.setWidget(self.card_container)
        
        # Основной макет
        main_layout.addWidget(menu_widget)
        main_layout.addWidget(scroll_area)
        self.setCentralWidget(main_widget)

    def loadPartnerCards(self):
        partners = self.db.query(modules.Partners).all()
        for partner in partners:
            card = self.create_partner_card(partner)
            self.card_layout.addWidget(card)

    def create_partner_card(self, partner):
    # Запрос общего объема реализации продукции для данного партнёра
        total_sales = self.db.query(modules.Partner_Products) \
                             .filter_by(partner_id=partner.id) \
                             .with_entities(func.sum(modules.Partner_Products.quantity)) \
                             .scalar() or 0  # Если нет данных, по умолчанию 0

        # Расчёт скидки на основе общего объема реализации
        discount = self.calculate_discount(total_sales)

        # Карточка партнёра
        card = QFrame()
        card.setStyleSheet("background-color: #F4E8D3; border-radius: 8px;")
        card.setFixedSize(400, 150)

        layout = QVBoxLayout(card)

        # Верхняя строка с типом и названием партнёра
        top_layout = QHBoxLayout()
        type_label = QLabel(f"{partner.type_rel.company_type} |")
        type_label.setFont(QFont("Segoe UI", 12, QFont.Bold))
        type_label.setStyleSheet("color: black;")

        name_label = QLabel(partner.company_name)
        name_label.setFont(QFont("Segoe UI", 12, QFont.Bold))
        name_label.setStyleSheet("color: black;")

        top_layout.addWidget(type_label)
        top_layout.addWidget(name_label)
        top_layout.addStretch(1)

        # Метка скидки
        discount_label = QLabel(f"Скидка: {discount} %")  # Отображаем рассчитанную скидку
        discount_label.setFont(QFont("Segoe UI", 12, QFont.Bold))
        discount_label.setStyleSheet("color: black;")
        top_layout.addWidget(discount_label)

        # Данные о директоре, телефоне и рейтинге
        director_label = QLabel(f"Директор: {partner.director_name}")
        phone_label = QLabel(f"{partner.phone}")
        rating_label = QLabel(f"Рейтинг: {partner.rating}")

        for label in (director_label, phone_label, rating_label):
            label.setFont(QFont("Segoe UI", 10))
            label.setStyleSheet("color: black;")

        # Добавляем всё в макет карточки
        layout.addLayout(top_layout)
        layout.addWidget(director_label)
        layout.addWidget(phone_label)
        layout.addWidget(rating_label)
        
        card.mouseDoubleClickEvent = lambda event, pid=partner.id: self.onClickEditPartner(pid)
        card.mousePressEvent = lambda event: card.setStyleSheet("background-color: #67BA80; border-radius: 8px;")
        card.mouseReleaseEvent = lambda event: card.setStyleSheet("background-color: #F4E8D3; border-radius: 8px;")

        return card

    @staticmethod
    def calculate_discount(total_sales):
        if total_sales < 10000:
            return 0
        elif 10000 <= total_sales < 50000:
            return 5
        elif 50000 <= total_sales < 300000:
            return 10
        else:
            return 15

        
    def onClickAddPartner(self):
        dialog = AddPartnerWindow(self.db)
        if dialog.exec() == QDialog.Accepted:
            self.refreshPartnersList()
            
    def refreshPartnersList(self):
        # Очистка текущих карточек
        for i in reversed(range(self.card_layout.count())): 
            widget_to_remove = self.card_layout.itemAt(i).widget()
            if widget_to_remove is not None:
                widget_to_remove.deleteLater()

        # Загрузка и отображение обновлённого списка партнёров
        self.loadPartnerCards()

    def onClickEditPartner(self, partner_id):
        dialog = EditPartnerWindow(self.db, partner_id)

        if dialog.exec() == QDialog.Accepted:
            self.refreshPartnersList()

    def onClickHistory(self):
        self.history_window = SalesHistoryWindow(self.db)
        self.history_window.show()
        self.close()