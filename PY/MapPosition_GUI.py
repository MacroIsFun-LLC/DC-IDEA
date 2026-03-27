import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class MapPositionGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Cursor World Position", width=320, height=220)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Grid Layout
        self.main_frame.grid_columnconfigure(1, weight=1)
        
        # X Position
        ctk.CTkLabel(self.main_frame, text="X-COORD:", font=self.label_font).grid(row=0, column=0, padx=20, pady=(20, 10), sticky="w")
        self.x_input = ctk.CTkEntry(self.main_frame, width=100, justify="center")
        self.x_input.grid(row=0, column=1, padx=(0, 20), pady=(20, 10), sticky="ew")
        self.x_input.configure(state="readonly")
        
        # Y Position
        ctk.CTkLabel(self.main_frame, text="Y-COORD:", font=self.label_font).grid(row=1, column=0, padx=20, pady=10, sticky="w")
        self.y_input = ctk.CTkEntry(self.main_frame, width=100, justify="center")
        self.y_input.grid(row=1, column=1, padx=(0, 20), pady=10, sticky="ew")
        self.y_input.configure(state="readonly")
        
        # OK Button
        self.btn_ok = ctk.CTkButton(self.main_frame, text="Close", command=self.destroy, 
                                     font=self.button_font, fg_color="#34495E", height=32)
        self.btn_ok.grid(row=2, column=0, columnspan=2, pady=20, padx=40, sticky="ew")

        if self.data:
            self.populate_data()

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def populate_data(self):
        if not self.data: return
        self.x_input.configure(state="normal")
        self.x_input.insert(0, str(self.data.get("x", "0")))
        self.x_input.configure(state="readonly")
        
        self.y_input.configure(state="normal")
        self.y_input.insert(0, str(self.data.get("y", "0")))
        self.y_input.configure(state="readonly")

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = MapPositionGUI(path)
    app.mainloop()
