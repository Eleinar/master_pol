from PySide6.QtCore import Qt
from PySide6.QtWidgets import (QMainWindow, QWidget, QVBoxLayout, QHBoxLayout, QPushButton, QScrollArea, QFrame, QLabel, QSizePolicy)
import modules
from sqlalchemy import func, or_

class AddPartnerWindow(QMainWindow):
    def __init__(self):
        super(AddPartnerWindow, self).__init__()
        self.setWindowTitle("Новый партнёр")
        self.db = modules.create_connection()
        
        main_widget = QWidget()