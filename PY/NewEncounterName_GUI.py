import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NewEncounterNameGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="New Encounter Table Setup", width=400, height=220)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Input Section
        ctk.CTkLabel(self.main_frame, text="Enter Name for New Encounter Profile:", font=self.label_font).pack(pady=(20, 10))
        
        self.name_input = ctk.CTkEntry(self.main_frame, width=320, justify="center", placeholder_text="e.g. Dark Cave Spawns")
        self.name_input.pack(pady=10)
        
        # Footer
        self.footer = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=20, padx=20)
        
        self.btn_create = ctk.CTkButton(self.footer, text="Initialize", command=self.save_and_exit, 
                                        font=self.button_font, fg_color="#27AE60", width=120)
        self.btn_create.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", width=120)
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
            "status": "ok"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NewEncounterNameGUI(path)
    app.mainloop()
