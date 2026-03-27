import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NewMapGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Create New Dransik Map", width=400, height=280)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Grid Layout
        self.main_frame.grid_columnconfigure(1, weight=1)
        
        # Name
        ctk.CTkLabel(self.main_frame, text="Map Name:", font=self.label_font).grid(row=0, column=0, padx=20, pady=20, sticky="w")
        self.name_input = ctk.CTkEntry(self.main_frame, width=200)
        self.name_input.grid(row=0, column=1, padx=(0, 20), pady=20, sticky="ew")
        
        # Dimensions Row
        self.dims_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.dims_frame.grid(row=1, column=0, columnspan=2, padx=20, pady=10, sticky="ew")
        
        ctk.CTkLabel(self.dims_frame, text="Width (X):", font=self.label_font).pack(side="left", padx=5)
        self.x_input = ctk.CTkEntry(self.dims_frame, width=80)
        self.x_input.pack(side="left", padx=5)
        
        ctk.CTkLabel(self.dims_frame, text="Height (Y):", font=self.label_font).pack(side="left", padx=(20, 5))
        self.y_input = ctk.CTkEntry(self.dims_frame, width=80)
        self.y_input.pack(side="left", padx=5)
        
        # Buttons
        self.btn_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.btn_frame.grid(row=2, column=0, columnspan=2, padx=20, pady=30, sticky="ew")
        
        self.btn_create = ctk.CTkButton(self.btn_frame, text="Generate Map", command=self.save_and_exit, 
                                        font=self.button_font, fg_color="#27AE60", height=40)
        self.btn_create.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.btn_frame, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
        self.btn_cancel.pack(side="right", expand=True, padx=5)

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "x": self.x_input.get(),
            "y": self.y_input.get(),
            "status": "created"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NewMapGUI(path)
    app.mainloop()
