from PySide6.QtCore import Qt
from PySide6.QtWidgets import (QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QScrollArea, QFrame, QLabel, QSizePolicy)
import modules
from add_partner_window import AddPartnerWindow
from sqlalchemy import func, or_


class PartnrerWindow(QMainWindow):
    def __init__(self):
        super(PartnrerWindow, self).__init__()
        self.setWindowTitle("Список партнёров")
        #установить размер окна
        
        # подключение к базе
        self.db = modules.create_connection()
        
        main_widget = QWidget()
        main_layot = QHBoxLayout(main_widget)
        
        button_layout = QVBoxLayout()
        add_partner_btn = QPushButton("Новый партнёр")
        history_btn = QPushButton("История реализации")
        partners_btn = QPushButton("Список партнёров")
        
        add_partner_btn.clicked.connect(self.onClickAddPartner)
        
        for button in (add_partner_btn, history_btn, partners_btn):
            button.setSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed)
            button.setStyleSheet("background-color: #67BA80; color: white; font-family: 'Segoe UI';")
            button_layout.addWidget(button)
            
        button_layout.addStretch()
        
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        
        card_container = QWidget()
        card_layout  = QVBoxLayout(card_container)
        
        partners = self.db.query(modules.Partners).all()
        for partner in partners:
            card = self.createPartnerCard(partner)
            card_layout.addWidget(card)
    
        card_container.setLayout(card_layout)
        scroll_area.setWidget(card_container)
        
        center_layout = QVBoxLayout()
        center_layout.addWidget(scroll_area)
        
        main_layot.addLayout(button_layout)
        main_layot.addLayout(center_layout, 1)
        
        self.setCentralWidget(main_widget)
    
    # Создание карточки партнёра
    def createPartnerCard(self, partner):
        card = QFrame()
        card.setStyleSheet("background-color: #F4E8D3; border-radius: 8px;")
        card.setFrameShape(QFrame.StyledPanel)
        card.setFixedHeight(180)  # Увеличим высоту карточки для нового порядка
    
        layout = QVBoxLayout(card)
    
        top_layout = QHBoxLayout()
        type_name_label = QLabel(partner.type_rel.company_type + " | " + partner.company_name)
    
        # Установим стили для типа и названия
        type_name_label.setAlignment(Qt.AlignLeft)
        type_name_label.setStyleSheet("font-family: 'Segoe UI'; font-size: 14px;")
    
        # Добавляем тип и название в горизонтальный макет
        top_layout.addWidget(type_name_label)
        top_layout.addStretch()  # Добавляем растяжение, чтобы элементы не сжимались
    
        # Информация о директоре, телефоне и рейтинге
        director_label = QLabel(partner.director_name)
        phone_label = QLabel(partner.phone)
        rating_label = QLabel(f"Rating: {partner.rating}")
    
    # Применим стили ко всем оставшимся полям
        for label in (director_label, phone_label, rating_label):
            label.setAlignment(Qt.AlignLeft)
            label.setStyleSheet("font-family: 'Segoe UI'; font-size: 14px;")

        # Добавляем виджеты в макет карточки
        layout.addWidget(type_name_label)
        layout.addWidget(director_label)
        layout.addWidget(phone_label)
        layout.addWidget(rating_label)
    
        return card
    
    def onClickAddPartner(self):
        
