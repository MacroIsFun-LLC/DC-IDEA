import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class GenericDialogGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Properties & Requirements", width=550, height=450)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure((0, 1), weight=1)
        
        # --- Left Column: Modifiers & Flags ---
        self.left_col = ctk.CTkFrame(self, fg_color="transparent")
        self.left_col.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        # Left Stats
        self.stats_labels = ["To Hit Mod", "Min Damage", "Max Damage", "Tick Speed", "Min Health", "Max Health"]
        self.stat_inputs = {}
        
        for label in self.stats_labels:
            row = ctk.CTkFrame(self.left_col, fg_color="transparent")
            row.pack(fill="x", pady=2)
            ctk.CTkLabel(row, text=f"{label}:", font=self.label_font, width=100, anchor="w").pack(side="left")
            entry = ctk.CTkEntry(row, width=80)
            entry.pack(side="right")
            self.stat_inputs[label] = entry
            
        # Flags Group
        self.flag_frame = ctk.CTkFrame(self.left_col)
        self.flag_frame.pack(fill="x", pady=20)
        ctk.CTkLabel(self.flag_frame, text="Item Registry Flags", font=self.button_font).pack(pady=5)
        
        self.check_repair = ctk.CTkCheckBox(self.flag_frame, text="Repairable", font=self.label_font)
        self.check_repair.pack(pady=2, padx=20, anchor="w")
        self.check_ranged = ctk.CTkCheckBox(self.flag_frame, text="Ranged Weapon", font=self.label_font)
        self.check_ranged.pack(pady=2, padx=20, anchor="w")
        self.check_magic = ctk.CTkCheckBox(self.flag_frame, text="Magic Property", font=self.label_font)
        self.check_magic.pack(pady=5, padx=20, anchor="w")
        
        # --- Right Column: Class & Requirements ---
        self.right_col = ctk.CTkFrame(self, fg_color="transparent")
        self.right_col.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        # Classification
        ctk.CTkLabel(self.right_col, text="Object Class:", font=self.label_font).pack(anchor="w")
        self.class_combo = ctk.CTkComboBox(self.right_col, values=["Warrior", "Mage", "Rogue", "Paladin", "Any"], width=160)
        self.class_combo.pack(pady=(0, 10), fill="x")
        
        ctk.CTkLabel(self.right_col, text="Alignment Rule:", font=self.label_font).pack(anchor="w")
        self.align_combo = ctk.CTkComboBox(self.right_col, values=["Good", "Neutral", "Evil", "Any"], width=160)
        self.align_combo.pack(pady=(0, 20), fill="x")
        
        # Requirement Group
        self.req_frame = ctk.CTkFrame(self.right_col)
        self.req_frame.pack(fill="both", expand=True)
        ctk.CTkLabel(self.req_frame, text="Attribute Requirements", font=self.button_font).pack(pady=10)
        
        self.req_labels = ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]
        self.req_inputs = {}
        
        for label in self.req_labels:
            row = ctk.CTkFrame(self.req_frame, fg_color="transparent")
            row.pack(fill="x", pady=2, padx=10)
            ctk.CTkLabel(row, text=f"{label}:", font=self.label_font, width=90, anchor="w").pack(side="left")
            entry = ctk.CTkEntry(row, width=60)
            entry.pack(side="right")
            self.req_inputs[label] = entry
            
        # Footer
        self.btn_save = ctk.CTkButton(self, text="Commit Global Data", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_save.grid(row=1, column=0, columnspan=2, pady=(0, 20), padx=20, sticky="ew")

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
        # Logic to set values from JSON...
        pass

    def save_and_exit(self):
        output = {"status": "success"} # Placeholder
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = GenericDialogGUI(path)
    app.mainloop()
