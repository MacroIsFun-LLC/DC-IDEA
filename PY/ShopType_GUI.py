import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ShopTypeGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Shop Category Configuration", width=400, height=320)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Header Box
        self.header = ctk.CTkFrame(self.main_frame, fg_color="#1a1a1a", height=60)
        self.header.pack(fill="x", padx=15, pady=15)
        self.header.pack_propagate(False)
        ctk.CTkLabel(self.header, text="Shop Type Properties", font=self.header_font).place(relx=0.5, rely=0.5, anchor="center")
        
        # Options
        self.options_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.options_frame.pack(fill="both", expand=True, padx=20)
        
        ctk.CTkLabel(self.options_frame, text="Current Merchant Classification:", font=self.label_font).pack(pady=5, anchor="w")
        self.type_combo = ctk.CTkComboBox(self.options_frame, values=["General Store", "Blacksmith", "Alchemist", "Tavern", "Library", "Stable"], width=200)
        self.type_combo.pack(pady=5, fill="x")
        
        self.check_buy = ctk.CTkCheckBox(self.options_frame, text="Merchant Buys Items from Players", font=self.label_font)
        self.check_buy.pack(pady=10, anchor="w")
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Apply Type Changes", command=self.save_and_exit, 
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
        self.type_combo.set(self.data.get("type", "General Store"))
        if self.data.get("can_buy"): self.check_buy.select()

    def save_and_exit(self):
        output = {
            "type": self.type_combo.get(),
            "can_buy": self.check_buy.get(),
            "status": "updated"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ShopTypeGUI(path)
    app.mainloop()
