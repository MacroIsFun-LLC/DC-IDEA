import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class GenericInputGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Input Required", width=420, height=140)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Horizontal Layout
        self.row = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.row.pack(expand=True)
        
        self.btn_ok = ctk.CTkButton(self.row, text="OK", width=80, height=32, command=self.save_and_exit, fg_color="#27AE60")
        self.btn_ok.pack(side="left", padx=10)
        
        self.input_field = ctk.CTkEntry(self.row, width=160, height=32, justify="center")
        self.input_field.pack(side="left", padx=10)
        self.input_field.focus_set()
        
        self.btn_cancel = ctk.CTkButton(self.row, text="Cancel", width=80, height=32, command=self.destroy, fg_color="#7F8C8D")
        self.btn_cancel.pack(side="left", padx=10)

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
        self.title(self.data.get("title", "Input Required"))
        self.input_field.insert(0, self.data.get("value", ""))

    def save_and_exit(self):
        output = {
            "value": self.input_field.get(),
            "status": "ok"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = GenericInputGUI(path)
    # Bind Enter key to OK
    app.bind('<Return>', lambda e: app.save_and_exit())
    app.mainloop()
