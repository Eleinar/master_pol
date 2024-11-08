from PySide6.QtCore import Qt
from PySide6.QtWidgets import QApplication
from partners_window import PartnrerWindow
app = QApplication([])
window = PartnrerWindow()
window.show()
app.exec()