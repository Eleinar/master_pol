from PySide6.QtWidgets import (
    QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QDialog,
    QTableWidget, QTableWidgetItem, QHeaderView, QLabel, QMessageBox
)
from PySide6.QtGui import QIcon, QPixmap
from PySide6.QtCore import Qt
import modules
import partners_window
import add_partner_window
from fpdf import FPDF  # Импортируем fpdf2

class SalesHistoryWindow(QMainWindow):
    def __init__(self, db):
        super(SalesHistoryWindow, self).__init__()
        self.setWindowTitle("История реализации продукции")
        self.setWindowIcon(QIcon("master_pol/logo.png"))
        self.setGeometry(100, 100, 800, 600)
        self.setStyleSheet("background-color: white")
        
        # Подключение к базе данных
        self.db = db
        
        # Основной виджет и макет
        main_widget = QWidget()
        main_layout = QHBoxLayout(main_widget)
        
        # Левое меню с кнопками
        menu_widget = QWidget()
        menu_layout = QVBoxLayout(menu_widget)
        menu_layout.setSpacing(10)
        
        # Кнопки меню
        new_partner_button = QPushButton("Новый партнёр")
        new_partner_button.clicked.connect(self.onClickAddPartner)
        
        history_button = QPushButton("История реализации")
        
        partner_list_button = QPushButton("Список партнёров")
        partner_list_button.clicked.connect(self.onClickPartnerList)
        
        # Кнопка для создания PDF-отчета
        pdf_button = QPushButton("Создать PDF отчёт")
        pdf_button.clicked.connect(self.generate_pdf_report)
        
        # Установка стиля для кнопок
        for button in [new_partner_button, history_button, partner_list_button, pdf_button]:
            button.setFixedWidth(140)
            button.setFixedHeight(40)
            button.setStyleSheet("background-color: #67BA80; color: white; font-weight: bold")
        
        # Логотип
        logo_label = QLabel()
        logo = QPixmap("master_pol/logo.png")
        logo_label.setPixmap(logo.scaled(100, 100, Qt.KeepAspectRatio))
        logo_label.setAlignment(Qt.AlignLeft)
        
        # Добавление логотипа и кнопок в меню
        menu_layout.addWidget(logo_label)
        menu_layout.addWidget(new_partner_button)
        menu_layout.addWidget(history_button)
        menu_layout.addWidget(partner_list_button)
        menu_layout.addWidget(pdf_button)
        menu_layout.addStretch(1)
        
        # Основное содержимое с таблицей
        content_widget = QWidget()
        content_layout = QVBoxLayout(content_widget)
        
        # Создание таблицы для отображения истории продаж
        self.table = QTableWidget()
        self.table.setColumnCount(5)
        self.table.setHorizontalHeaderLabels(["№", "Партнёр", "Продукция", "Количество", "Дата продажи"])
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
        self.table.setStyleSheet("background-color: #F4E8D3")
        
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
            self.db.query(
                modules.Partner_Products.id,
                modules.Partners.company_name, 
                modules.Products.product_name, 
                modules.ProductTypes.type_name,  # Добавляем тип продукции
                modules.Partner_Products.quantity, 
                modules.Partner_Products.sale_date
            )
            .join(modules.Partners, modules.Partner_Products.partner_id == modules.Partners.id)
            .join(modules.Products, modules.Partner_Products.product_id == modules.Products.id)
            .join(modules.ProductTypes, modules.Products.product_type_id == modules.ProductTypes.id)
            .all()
        )
        
        # Установка количества строк в таблице
        self.table.setRowCount(len(sales_data))
        
        # Заполнение таблицы данными
        for row, sale in enumerate(sales_data):
            self.table.setItem(row, 0, QTableWidgetItem(str(sale.id)))
            self.table.setItem(row, 1, QTableWidgetItem(sale.company_name))
            product_info = f"{sale.type_name} - {sale.product_name}"
            self.table.setItem(row, 2, QTableWidgetItem(product_info))
            self.table.setItem(row, 3, QTableWidgetItem(str(sale.quantity)))
            self.table.setItem(row, 4, QTableWidgetItem(sale.sale_date.strftime("%Y-%m-%d") if sale.sale_date else ""))
        
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
    
    def generate_pdf_report(self):
        pdf = FPDF()
        pdf.add_page()
        
        # Установка шрифта с поддержкой Unicode
        pdf.add_font("DejaVu", "", "master_pol/DejaVuSans.ttf", uni=True)
        pdf.set_font("DejaVu", "", 12)
        
        pdf.cell(200, 10, "Отчёт по количеству материала", ln=True, align="C")
        
        pdf.ln(10)
        pdf.multi_cell(0, 10, "Расчёт количества материала, требуемого для производства продукции:")
        
        QMessageBox.information(self, "Успешно", "Отчёт создан.")
        
        # Сохранение файла
        pdf.output("master_pol/sales_report.pdf")
