import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class SpellDialogGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Spell Configuration Dialog", width=700, height=520)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Grid layout (Master-Detail)
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # --- Left: Master List ---
        self.list_frame = ctk.CTkFrame(self, width=240, corner_radius=0)
        self.list_frame.grid(row=0, column=0, rowspan=2, sticky="nsew")
        ctk.CTkLabel(self.list_frame, text="Spell Compendium", font=self.header_font).pack(pady=20, padx=20)
        
        self.spell_list = ctk.CTkScrollableFrame(self.list_frame, fg_color="#1a1a1a")
        self.spell_list.pack(fill="both", expand=True, padx=15, pady=(0, 15))
        
        self.btn_new = ctk.CTkButton(self.list_frame, text="New Spell", height=32, fg_color="#27AE60")
        self.btn_new.pack(pady=5, padx=15, fill="x")
        self.btn_del = ctk.CTkButton(self.list_frame, text="Retire Spell", height=32, fg_color="#C0392B")
        self.btn_del.pack(pady=5, padx=15, fill="x")
        
        # --- Right: Spell Properties ---
        self.detail_frame = ctk.CTkFrame(self, corner_radius=15)
        self.detail_frame.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.detail_frame, text="Spell Properties", font=self.button_font).pack(pady=10)
        
        # Essential Info
        self.info_frame = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.info_frame.pack(fill="x", padx=20, pady=10)
        
        ctk.CTkLabel(self.info_frame, text="Name:", font=self.label_font).pack(side="left")
        self.name_input = ctk.CTkEntry(self.info_frame, width=220)
        self.name_input.pack(side="left", padx=10)
        
        # Mana & Code
        self.mana_frame = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.mana_frame.pack(fill="x", padx=20, pady=5)
        ctk.CTkLabel(self.mana_frame, text="Mana Usage:", font=self.label_font).pack(side="left")
        self.mana_input = ctk.CTkEntry(self.mana_frame, width=80)
        self.mana_input.pack(side="left", padx=10)
        self.btn_code = ctk.CTkButton(self.mana_frame, text="Edit Source Code", width=120, height=28, fg_color="#34495E")
        self.btn_code.pack(side="right")
        
        # Target & Area
        self.target_frame = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.target_frame.pack(fill="x", padx=20, pady=5)
        ctk.CTkLabel(self.target_frame, text="Target:", font=self.label_font).pack(side="left")
        self.target_combo = ctk.CTkComboBox(self.target_frame, values=["Single Unit", "Area of Effect", "Self", "Directional"], width=150)
        self.target_combo.pack(side="left", padx=10)
        ctk.CTkLabel(self.target_frame, text="AoE Radius:", font=self.label_font).pack(side="left", padx=(10, 5))
        self.area_input = ctk.CTkEntry(self.target_frame, width=60)
        self.area_input.pack(side="left")
        
        # Spell Levels (Segmented)
        ctk.CTkLabel(self.detail_frame, text="Spell Mastery Level (1-8):", font=self.label_font).pack(pady=(20, 5), padx=20, anchor="w")
        self.level_seg = ctk.CTkSegmentedButton(self.detail_frame, values=["1", "2", "3", "4", "5", "6", "7", "8"], font=self.label_font)
        self.level_seg.pack(pady=5, padx=20, fill="x")
        self.level_seg.set("1")
        
        # Skills Requirements
        self.skill_frame = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.skill_frame.pack(fill="x", padx=20, pady=20)
        
        ctk.CTkLabel(self.skill_frame, text="Magery Scaling:", font=self.label_font).grid(row=0, column=0, sticky="w", pady=5)
        self.magery_scale = ctk.CTkEntry(self.skill_frame, width=60)
        self.magery_scale.grid(row=0, column=1, padx=10, sticky="w")
        
        ctk.CTkLabel(self.skill_frame, text="Min Requirement:", font=self.label_font).grid(row=1, column=0, sticky="w", pady=5)
        self.magery_req = ctk.CTkEntry(self.skill_frame, width=60)
        self.magery_req.grid(row=1, column=1, padx=10, sticky="w")
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=1, pady=10, padx=20, sticky="ew")
        self.btn_save = ctk.CTkButton(self.footer, text="Save Spell Configuration", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#27AE60", height=40)
        self.btn_save.pack(fill="x")

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
        self.name_input.insert(0, self.data.get("name", ""))
        self.mana_input.insert(0, str(self.data.get("mana", "")))
        self.target_combo.set(self.data.get("target", "Single Unit"))
        self.area_input.insert(0, str(self.data.get("area", "")))
        self.level_seg.set(str(self.data.get("level", "1")))
        self.magery_scale.insert(0, str(self.data.get("scaling", "")))
        self.magery_req.insert(0, str(self.data.get("requirement", "")))

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "mana": self.mana_input.get(),
            "target": self.target_combo.get(),
            "area": self.area_input.get(),
            "level": self.level_seg.get(),
            "scaling": self.magery_scale.get(),
            "requirement": self.magery_req.get()
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = SpellDialogGUI(path)
    app.mainloop()
