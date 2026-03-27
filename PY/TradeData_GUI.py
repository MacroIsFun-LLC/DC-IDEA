import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class TradeDataGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Trade Object & Crafting Editor", width=850, height=580)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Grid layout (Three Column: Types, Objects, Details)
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)
        self.grid_columnconfigure(2, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # --- Column 1: Categories & Types ---
        self.col1 = ctk.CTkFrame(self, corner_radius=0)
        self.col1.grid(row=0, column=0, sticky="nsew", padx=2, pady=2)
        ctk.CTkLabel(self.col1, text="Crafting Categories", font=self.button_font).pack(pady=15)
        self.type_combo = ctk.CTkComboBox(self.col1, values=["Blacksmithing", "Alchemy", "Tailoring", "Carpentry"], width=180)
        self.type_combo.pack(pady=5, padx=10)
        self.type_list = ctk.CTkScrollableFrame(self.col1, fg_color="#1a1a1a")
        self.type_list.pack(fill="both", expand=True, padx=10, pady=10)
        
        # --- Column 2: Trade Objects ---
        self.col2 = ctk.CTkFrame(self, corner_radius=0)
        self.col2.grid(row=0, column=1, sticky="nsew", padx=2, pady=2)
        ctk.CTkLabel(self.col2, text="Trade Objects", font=self.button_font).pack(pady=15)
        self.obj_combo = ctk.CTkComboBox(self.col2, values=["All Items", "Weapons", "Armor", "Tools"], width=180)
        self.obj_combo.pack(pady=5, padx=10)
        self.obj_list = ctk.CTkScrollableFrame(self.col2, fg_color="#1a1a1a")
        self.obj_list.pack(fill="both", expand=True, padx=10, pady=10)
        
        # --- Column 3: Configuration ---
        self.col3 = ctk.CTkFrame(self, corner_radius=15)
        self.col3.grid(row=0, column=2, sticky="nsew", padx=20, pady=20)
        ctk.CTkLabel(self.col3, text="Object Information", font=self.button_font).pack(pady=15)
        
        # Properties
        self.prop_frame = ctk.CTkFrame(self.col3, fg_color="transparent")
        self.prop_frame.pack(fill="x", padx=15)
        
        self.add_field("Source Material:", "Iron Ingot", is_combo=True, options=["Iron Ingot", "Steel Bar", "Leather", "Wood"])
        self.qty_input = self.add_field("Quantity Required:", "1")
        self.skill_input = self.add_field("Min Skill Req:", "0")
        self.diff_input = self.add_field("Crafting Difficulty:", "0")
        
        # Footer
        self.btn_save = ctk.CTkButton(self.col3, text="Save Trade Config", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#27AE60", height=40)
        self.btn_save.pack(side="bottom", fill="x", padx=20, pady=20)

    def add_field(self, label, default, is_combo=False, options=None):
        ctk.CTkLabel(self.prop_frame, text=label, font=self.label_font).pack(pady=(15, 2), anchor="w")
        if is_combo:
            widget = ctk.CTkComboBox(self.prop_frame, values=options, width=200)
            widget.set(default)
        else:
            widget = ctk.CTkEntry(self.prop_frame, width=200)
            widget.insert(0, default)
        widget.pack(pady=2, fill="x")
        return widget

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def save_and_exit(self):
        output = {
            "source": "Iron Ingot",
            "qty": self.qty_input.get(),
            "skill": self.skill_input.get(),
            "difficulty": self.diff_input.get()
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = TradeDataGUI(path)
    app.mainloop()
