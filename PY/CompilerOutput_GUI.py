import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class CompilerOutputGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="System Compiler Console", width=750, height=800)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Console Frame
        self.console_frame = ctk.CTkFrame(self, fg_color="#050505", corner_radius=15, border_width=1, border_color="#333333")
        self.console_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        # Text Area (Monospace)
        self.text_area = ctk.CTkTextbox(self.console_frame, font=("Consolas", 13), fg_color="transparent", text_color="#00FF00")
        self.text_area.pack(fill="both", expand=True, padx=15, pady=15)
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Close Console", command=self.destroy, 
                                      font=self.button_font, fg_color="#2C3E50", height=45)
        self.btn_done.pack(side="bottom", fill="x", padx=40, pady=(0, 20))

        if self.data:
            self.populate_data()
        else:
            self.text_area.insert("1.0", "> System Initialized...\n> Waiting for compiler stream...\n")

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def populate_data(self):
        if not self.data: return
        self.text_area.delete("1.0", "end")
        self.text_area.insert("1.0", self.data.get("output", "No output received."))

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = CompilerOutputGUI(path)
    app.mainloop()
