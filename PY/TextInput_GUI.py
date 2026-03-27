import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class TextInputGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Advanced Text Input Dialog", width=520, height=600)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(2, weight=1)
        
        # Header Row
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, padx=20, pady=(20, 10), sticky="ew")
        
        ctk.CTkLabel(self.header, text="Please enter text or select a template:", font=self.label_font).pack(side="left")
        
        # Action Buttons (Top Right)
        self.btn_frame = ctk.CTkFrame(self.header, fg_color="transparent")
        self.btn_frame.pack(side="right")
        
        self.btn_ok = ctk.CTkButton(self.btn_frame, text="Commit", command=self.save_and_exit, 
                                     width=100, font=self.button_font, fg_color="#27AE60")
        self.btn_ok.pack(side="left", padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.btn_frame, text="Cancel", command=self.destroy, 
                                        width=100, font=self.button_font, fg_color="#7F8C8D")
        self.btn_cancel.pack(side="left", padx=5)
        
        # Template List
        self.temp_frame = ctk.CTkFrame(self, fg_color="#111111", border_width=1, border_color="#333333", height=150)
        self.temp_frame.grid(row=1, column=0, padx=20, pady=10, sticky="ew")
        self.temp_frame.pack_propagate(False)
        
        self.temp_scroll = ctk.CTkScrollableFrame(self.temp_frame, fg_color="transparent")
        self.temp_scroll.pack(fill="both", expand=True, padx=5, pady=5)
        
        self.templates = ["Standard Signage", "NPC Greeting", "Quest Log Entry", "Item Lore", "System Message", "Combat Log"]
        for t in self.templates:
            btn = ctk.CTkButton(self.temp_scroll, text=t, font=self.label_font, anchor="w", 
                                fg_color="transparent", hover_color="#222222", height=32,
                                command=lambda text=t: self.set_template(text))
            btn.pack(fill="x", pady=1)
            
        # Edit Area
        ctk.CTkLabel(self, text="Global Text Editor Area:", font=self.button_font).grid(row=2, column=0, padx=25, pady=(20, 5), sticky="w")
        
        self.edit_frame = ctk.CTkFrame(self, fg_color="#0a0a0a", corner_radius=10, border_width=1, border_color="#444444")
        self.edit_frame.grid(row=3, column=0, padx=20, pady=(0, 20), sticky="nsew")
        
        self.text_area = ctk.CTkTextbox(self.edit_frame, font=("Consolas", 14), fg_color="transparent", corner_radius=0)
        self.text_area.pack(fill="both", expand=True, padx=10, pady=10)

        if self.data:
            self.populate_data()

    def set_template(self, text):
        self.text_area.delete("1.0", "end")
        self.text_area.insert("1.0", f"--- {text} Template ---\n\n[ Enter content here ]")

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def populate_data(self):
        if not self.data: return
        self.text_area.insert("1.0", self.data.get("text", ""))

    def save_and_exit(self):
        output = {
            "text": self.text_area.get("1.0", "end-1c"),
            "status": "ok"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = TextInputGUI(path)
    app.mainloop()
