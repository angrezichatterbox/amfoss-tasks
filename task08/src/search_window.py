from PySide6.QtGui import QPixmap, QFont, QIcon
import sys
import os
import requests
from PySide6.QtWidgets import QApplication, QWidget, QLabel, QLineEdit, QPushButton, QVBoxLayout, QMainWindow
from PySide6.QtWidgets import QMainWindow, QVBoxLayout, QHBoxLayout, QTextBrowser
from PySide6.QtGui import QFont
from PySide6.QtWidgets import QFileDialog, QDialog, QPushButton, QSizePolicy
from PySide6.QtCore import Qt

class SearchWindow(QWidget):
    def __init__(self):
        super().__init__()

        self.initUI()

    def initUI(self):
        self.setFixedSize(900, 600)

        self.layout = QVBoxLayout(self)

        self.background_label = QLabel(self)
        background_image = QPixmap("/Users/gauthammohanraj/Desktop/Poke-Search_Demo/src/landing.jpg")
        self.background_label.setPixmap(background_image)
        self.background_label.setGeometry(0, 0, 900, 900)

        self.layout.addWidget(self.background_label)

        self.textbox = QLineEdit(self)
        self.layout.addWidget(self.textbox)

        label1 = QLabel("Enter the Pokémon name", self)
        self.layout.addWidget(label1)

        button_layout = QHBoxLayout()
        enter_button = QPushButton("Search", self)
        button_layout.addWidget(enter_button)
        enter_button.clicked.connect(self.handle_search)

        capture_button = QPushButton("Capture", self)
        button_layout.addWidget(capture_button)
        capture_button.clicked.connect(self.handle_capture)

        self.display_button = QPushButton("Display", self)
        button_layout.addWidget(self.display_button)
        self.display_button.clicked.connect(self.display_images)

        self.layout.addLayout(button_layout)

        self.result_label = QTextBrowser(self)  
        self.result_label.setFont(QFont("Times", 14))  
        self.layout.addWidget(self.result_label)

        self.image_data = []
        self.current_image_index = 0

        self.background_label.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
        self.background_label.setAlignment(Qt.AlignCenter)

    def fetch_data(self, pokemon_name):
        url = f"https://pokeapi.co/api/v2/pokemon/{pokemon_name.lower()}/"
        try:
            response = requests.get(url)
            response.raise_for_status()
            data = response.json()
            return data
        except requests.exceptions.RequestException as e:
            print(f"Failed to fetch data from API: {e}")
            return None

    def handle_search(self):
        pokemon_name = self.textbox.text()
        data = self.fetch_data(pokemon_name)
        if data:
            name = data['name']
            abilities = [ability['ability']['name'] for ability in data['abilities']]
            types = [type['type']['name'] for type in data['types']]
            stats = [(stat['stat']['name'], stat['base_stat']) for stat in data['stats']]
            
            self.result_label.clear()
            self.result_label.append(f"Name: {name}")
            self.result_label.append(f"Abilities: {', '.join(abilities)}")
            self.result_label.append(f"Types: {', '.join(types)}")
            self.result_label.append("Stats:")
            for stat_name, base_stat in stats:
                self.result_label.append(f"  - {stat_name.capitalize()}: {base_stat}")
            
            image_url = data['sprites']['other']['official-artwork']['front_default']
            try:
                image_response = requests.get(image_url)
                image_response.raise_for_status()
                image = QPixmap()
                image.loadFromData(image_response.content)
                self.background_label.setPixmap(image)
                self.image_data.append(image_response.content)
                self.current_image_index = len(self.image_data) - 1
            except requests.exceptions.RequestException as e:
                print(f"Failed to fetch image: {e}")

    def handle_capture(self):
        if self.image_data:
            options = QFileDialog.Options()
            file_path, _ = QFileDialog.getSaveFileName(self, "Save Image", "", "Images (*.png *.jpg);;All Files (*)", options=options)
            if file_path:
                with open(file_path, 'wb') as file:
                    file.write(self.image_data[self.current_image_index])
                    print(f"Image saved to {file_path}")

    def display_images(self):
        if self.image_data:
            display_window = DisplayWindow(self.image_data)
            display_window.exec_()

class DisplayWindow(QDialog):
    def __init__(self, image_data_list):
        super().__init__()

        self.image_data_list = image_data_list

        self.initUI()

    def initUI(self):
        self.setWindowTitle("Image Viewer")
        self.setGeometry(100, 100, 800, 600)

        self.image_view = QLabel(self)
        self.image_view.setGeometry(10, 10, 500, 500)
        self.image_view.setAlignment(Qt.AlignCenter)

        self.prev_button = QPushButton("Previous", self)
        self.prev_button.setGeometry(10, 520, 100, 30)
        self.prev_button.clicked.connect(self.show_previous_image)

        self.next_button = QPushButton("Next", self)
        self.next_button.setGeometry(690, 520, 100, 30)
        self.next_button.clicked.connect(self.show_next_image)

        self.current_image_index = 0
        self.show_image()

    def show_image(self):
        if self.image_data_list:
            pixmap = QPixmap()
            pixmap.loadFromData(self.image_data_list[self.current_image_index])
            self.image_view.setPixmap(pixmap)

    def show_previous_image(self):
        if self.current_image_index > 0:
            self.current_image_index -= 1
            self.show_image()

    def show_next_image(self):
        if self.current_image_index < len(self.image_data_list) - 1:
            self.current_image_index += 1
            self.show_image()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = SearchWindow()
    window.show()
    sys.exit(app.exec())
