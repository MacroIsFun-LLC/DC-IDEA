import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class SignDataGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="World Sign Editor", width=480, height=420)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Container Outer
        self.outer_frame = ctk.CTkFrame(self, corner_radius=15)
        self.outer_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        # Editor
        ctk.CTkLabel(self.outer_frame, text="Enter Signage Script / Text:", font=self.button_font).pack(pady=(15, 5), padx=20, anchor="w")
        
        self.edit_frame = ctk.CTkFrame(self.outer_frame, fg_color="#0a0a0a", corner_radius=10, border_width=1, border_color="#333333")
        self.edit_frame.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        
        self.text_area = ctk.CTkTextbox(self.edit_frame, font=("Inter", 14), fg_color="transparent")
        self.text_area.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Burn Text to Sign", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_done.pack(side="bottom", fill="x", padx=20, pady=(0, 20))

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
    app = SignDataGUI(path)
    app.mainloop()
