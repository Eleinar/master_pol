from PySide6.QtWidgets import QApplication
from partners_window import PartnerWindow
app = QApplication([])
window = PartnerWindow()
window.show()
app.exec()