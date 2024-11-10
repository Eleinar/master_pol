from PySide6.QtWidgets import (
    QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QDialog,
    QTableWidget, QTableWidgetItem, QHeaderView
)

import modules
import partners_window
import add_partner_window

class SalesHistoryWindow(QMainWindow):
    def __init__(self, db):
        super(SalesHistoryWindow, self).__init__()
        self.setWindowTitle("История реализации продукции")
        self.setGeometry(100, 100, 800, 600)
        
        # Подключение к базе данных
        self.db = db
        
        # Основной виджет и макет
        main_widget = QWidget()
        main_layout = QHBoxLayout(main_widget)
        
        # Левое меню с кнопками
        menu_widget = QWidget()
        menu_layout = QVBoxLayout(menu_widget)
        menu_layout.setSpacing(10)
        
        new_partner_button = QPushButton("Новый партнёр")
        new_partner_button.clicked.connect(self.onClickAddPartner)
        history_button = QPushButton("История реализации")
        partner_list_button = QPushButton("Список партнёров")
        partner_list_button.clicked.connect(self.onClickPartnerList)
        
        # Установка стиля для кнопок
        for button in [new_partner_button, history_button, partner_list_button]:
            button.setFixedWidth(120)
            button.setFixedHeight(40)
            button.setStyleSheet("background-color: #67BA80")
        
        menu_layout.addWidget(new_partner_button)
        menu_layout.addWidget(history_button)
        menu_layout.addWidget(partner_list_button)
        menu_layout.addStretch(1)
        
        # Основное содержимое с таблицей
        content_widget = QWidget()
        content_layout = QVBoxLayout(content_widget)
        
        # Создание таблицы для отображения истории продаж
        self.table = QTableWidget()
        self.table.setColumnCount(5)
        self.table.setHorizontalHeaderLabels(["№", "Партнёр", "Продукция", "Количество", "Дата продажи"])
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        
        # Загрузка данных в таблицу
        self.load_sales_history()
        
        # Добавление таблицы в основной макет
        content_layout.addWidget(self.table)
        
        # Добавление бокового меню и основного содержимого в основной макет
        main_layout.addWidget(menu_widget)
        main_layout.addWidget(content_widget)
        
        # Установка основного виджета
        self.setCentralWidget(main_widget)
    
    def load_sales_history(self):
        # Запрос данных из таблицы partner_products
        sales_data = (
            self.db.query(modules.Partner_Products.id, modules.Partners.company_name, 
                          modules.Products.product_name, modules.Partner_Products.quantity, 
                          modules.Partner_Products.delivery_date)
            .join(modules.Partners, modules.Partner_Products.partner_id == modules.Partners.id)
            .join(modules.Products, modules.Partner_Products.product_id == modules.Products.id)
            .all()
        )
        
        # Установка количества строк в таблице
        self.table.setRowCount(len(sales_data))
        
        # Заполнение таблицы данными
        for row, sale in enumerate(sales_data):
            self.table.setItem(row, 0, QTableWidgetItem(str(sale.id)))
            self.table.setItem(row, 1, QTableWidgetItem(sale.company_name))
            self.table.setItem(row, 2, QTableWidgetItem(sale.product_name))
            self.table.setItem(row, 3, QTableWidgetItem(str(sale.quantity)))
            self.table.setItem(row, 4, QTableWidgetItem(sale.delivery_date.strftime("%Y-%m-%d") if sale.sale_date else ""))
        
        # Выровнять содержимое ячеек по центру
        self.table.resizeColumnsToContents()
        self.table.resizeRowsToContents()
        
    def onClickAddPartner(self):
        dialog = add_partner_window.AddPartnerWindow(self.db)
        if dialog.exec() == QDialog.Accepted:
            self.refreshPartnersList()
    
    def onClickPartnerList(self):
        self.partners_window = partners_window.PartnerWindow()
        self.partners_window.show()
        self.close()
