import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ArmorDataGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Armor Data Configuration", width=550, height=450)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Container
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Row 1: Type and Alignment
        self.row1 = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.row1.pack(fill="x", padx=10, pady=10)
        
        ctk.CTkLabel(self.row1, text="Type:", font=self.label_font).pack(side="left", padx=(0, 10))
        self.type_combo = ctk.CTkComboBox(self.row1, values=["Helmet", "Chest", "Legs", "Shield", "Gloves", "Boots"], width=150)
        self.type_combo.pack(side="left")
        
        ctk.CTkLabel(self.row1, text="Alignment:", font=self.label_font).pack(side="left", padx=(20, 10))
        self.align_combo = ctk.CTkComboBox(self.row1, values=["Neutral", "Good", "Evil"], width=130)
        self.align_combo.pack(side="left")
        
        # Row 2: Protection and Health
        self.row2 = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.row2.pack(fill="x", padx=10, pady=10)
        
        ctk.CTkLabel(self.row2, text="Protection:", font=self.label_font).pack(side="left", padx=(0, 10))
        self.prot_input = ctk.CTkEntry(self.row2, width=80)
        self.prot_input.pack(side="left")
        
        ctk.CTkLabel(self.row2, text="Min Health:", font=self.label_font).pack(side="left", padx=(20, 10))
        self.min_hp = ctk.CTkEntry(self.row2, width=70)
        self.min_hp.pack(side="left")
        
        ctk.CTkLabel(self.row2, text="Max Health:", font=self.label_font).pack(side="left", padx=(20, 10))
        self.max_hp = ctk.CTkEntry(self.row2, width=70)
        self.max_hp.pack(side="left")
        
        # Row 3: Flags and Attributes (Side by Side)
        self.row3 = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.row3.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Flags Group
        self.flags_frame = ctk.CTkFrame(self.row3)
        self.flags_frame.pack(side="left", fill="both", expand=True, padx=(0, 10))
        ctk.CTkLabel(self.flags_frame, text="Flags", font=self.button_font).pack(pady=5)
        self.check_repair = ctk.CTkCheckBox(self.flags_frame, text="Can be repaired")
        self.check_repair.pack(pady=5, padx=10, anchor="w")
        self.check_magic = ctk.CTkCheckBox(self.flags_frame, text="Magic")
        self.check_magic.pack(pady=5, padx=10, anchor="w")
        
        # Requirements Group
        self.req_frame = ctk.CTkFrame(self.row3)
        self.req_frame.pack(side="left", fill="both", expand=True)
        ctk.CTkLabel(self.req_frame, text="Requirements", font=self.button_font).pack(pady=5)
        
        self.req_entries = {}
        for attr in ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]:
            row = ctk.CTkFrame(self.req_frame, fg_color="transparent")
            row.pack(fill="x", padx=10, pady=2)
            ctk.CTkLabel(row, text=f"{attr}:", font=ctk.CTkFont(size=10)).pack(side="left")
            entry = ctk.CTkEntry(row, width=50, height=22)
            entry.pack(side="right")
            self.req_entries[attr] = entry

        # Footer Buttons
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=20, padx=20)
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Save Changes", command=self.save_and_exit, font=self.button_font, fg_color="#27AE60", hover_color="#2ECC71")
        self.btn_ok.pack(side="left", expand=True, padx=10)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, font=self.button_font, fg_color="#C0392B", hover_color="#E74C3C")
        self.btn_cancel.pack(side="left", expand=True, padx=10)

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
        # Logic to fill inputs from self.data
        if not self.data: return
        self.type_combo.set(self.data.get("type", "Chest"))
        self.align_combo.set(self.data.get("align", "Neutral"))
        self.prot_input.insert(0, str(self.data.get("protection", "")))
        self.min_hp.insert(0, str(self.data.get("min_hp", "")))
        self.max_hp.insert(0, str(self.data.get("max_hp", "")))
        if self.data.get("repairable"): self.check_repair.select()
        if self.data.get("magic"): self.check_magic.select()
        
        reqs = self.data.get("reqs", {})
        for attr, entry in self.req_entries.items():
            entry.insert(0, str(reqs.get(attr, "")))

    def save_and_exit(self):
        output = {
            "type": self.type_combo.get(),
            "align": self.align_combo.get(),
            "protection": self.prot_input.get(),
            "min_hp": self.min_hp.get(),
            "max_hp": self.max_hp.get(),
            "repairable": self.check_repair.get(),
            "magic": self.check_magic.get(),
            "reqs": {attr: entry.get() for attr, entry in self.req_entries.items()}
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS") # Signal to AutoIt
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ArmorDataGUI(path)
    app.mainloop()
