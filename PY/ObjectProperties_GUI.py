import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ObjectPropertiesGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Global Object Template Properties", width=420, height=250)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Outer Frame
        self.outer_frame = ctk.CTkFrame(self, corner_radius=15)
        self.outer_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        # Property Editor
        ctk.CTkLabel(self.outer_frame, text="Metadata configuration for this template:", font=self.label_font).pack(pady=(15, 5), padx=20, anchor="w")
        
        self.edit_frame = ctk.CTkFrame(self.outer_frame, fg_color="#0a0a0a", corner_radius=10, border_width=1, border_color="#444444")
        self.edit_frame.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        
        self.text_area = ctk.CTkTextbox(self.edit_frame, font=("Segoe UI", 12), fg_color="transparent")
        self.text_area.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=0, pady=(0, 20), padx=20, sticky="ew")
        
        self.btn_save = ctk.CTkButton(self.footer, text="Apply Meta", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_save.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
        self.btn_cancel.pack(side="right", expand=True, padx=5)

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
        self.text_area.insert("1.0", self.data.get("properties", "type: static\ndestructible: false"))

    def save_and_exit(self):
        output = {
            "properties": self.text_area.get("1.0", "end-1c"),
            "status": "ok"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ObjectPropertiesGUI(path)
    app.mainloop()
