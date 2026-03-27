import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NPCDialogGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik NPC Intelligence & Stats", width=620, height=650)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure((0, 1), weight=1)
        
        # --- Header: Name ---
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, columnspan=2, padx=20, pady=20, sticky="ew")
        ctk.CTkLabel(self.header, text="NPC Name:", font=self.label_font).pack(side="left")
        self.name_input = ctk.CTkEntry(self.header, width=350)
        self.name_input.pack(side="left", padx=15)
        
        # --- Left: Core Attributes ---
        self.left_col = ctk.CTkFrame(self)
        self.left_col.grid(row=1, column=0, padx=20, pady=10, sticky="nsew")
        ctk.CTkLabel(self.left_col, text="Primary Attributes", font=self.button_font).pack(pady=10)
        
        self.attr_frame = ctk.CTkFrame(self.left_col, fg_color="transparent")
        self.attr_frame.pack(fill="x", padx=20, pady=10)
        
        self.attr_labels = ["Strength", "Intelligence", "Dexterity", "Constitution"]
        self.attr_inputs = {}
        for i, label in enumerate(self.attr_labels):
            row = ctk.CTkFrame(self.attr_frame, fg_color="transparent")
            row.pack(fill="x", pady=2)
            ctk.CTkLabel(row, text=f"{label}:", font=self.label_font, width=100, anchor="w").pack(side="left")
            entry = ctk.CTkEntry(row, width=80)
            entry.pack(side="right")
            self.attr_inputs[label] = entry

        # --- Right: Vitals & Status ---
        self.right_col = ctk.CTkFrame(self)
        self.right_col.grid(row=1, column=1, padx=20, pady=10, sticky="nsew")
        ctk.CTkLabel(self.right_col, text="Vitals & Rating", font=self.button_font).pack(pady=10)
        
        self.vit_frame = ctk.CTkFrame(self.right_col, fg_color="transparent")
        self.vit_frame.pack(fill="x", padx=20, pady=10)
        
        self.vit_labels = ["Health", "Max Health", "Mana", "Level", "Armorclass"]
        self.vit_inputs = {}
        for i, label in enumerate(self.vit_labels):
            row = ctk.CTkFrame(self.vit_frame, fg_color="transparent")
            row.pack(fill="x", pady=2)
            ctk.CTkLabel(row, text=f"{label}:", font=self.label_font, width=100, anchor="w").pack(side="left")
            entry = ctk.CTkEntry(row, width=80)
            entry.pack(side="right")
            self.vit_inputs[label] = entry

        # --- Bottom: Logic & Alignment ---
        self.logic_frame = ctk.CTkFrame(self, corner_radius=15)
        self.logic_frame.grid(row=2, column=0, columnspan=2, padx=20, pady=20, sticky="ew")
        
        # Alignment
        align_row = ctk.CTkFrame(self.logic_frame, fg_color="transparent")
        align_row.pack(fill="x", padx=20, pady=10)
        ctk.CTkLabel(align_row, text="Moral Alignment:", font=self.label_font).pack(side="left", padx=(0, 20))
        self.align_btn = ctk.CTkSegmentedButton(align_row, values=["Good", "Neutral", "Evil"], font=self.button_font, height=35)
        self.align_btn.pack(side="left", fill="x", expand=True)
        
        # Activity & Shop
        form_row = ctk.CTkFrame(self.logic_frame, fg_color="transparent")
        form_row.pack(fill="x", padx=20, pady=10)
        
        ctk.CTkLabel(form_row, text="Activity:", font=self.label_font).grid(row=0, column=0, sticky="w")
        self.activity_combo = ctk.CTkComboBox(form_row, values=["Wander", "Guard", "Shopkeep", "Patrol", "Static"], width=150)
        self.activity_combo.grid(row=0, column=1, padx=10, pady=5)
        
        ctk.CTkLabel(form_row, text="Shop Type:", font=self.label_font).grid(row=1, column=0, sticky="w")
        self.shop_combo = ctk.CTkComboBox(form_row, values=["None", "General", "Weapon", "Armor", "Magic"], width=150)
        self.shop_combo.grid(row=1, column=1, padx=10, pady=5)
        
        self.btn_inv = ctk.CTkButton(form_row, text="Edit Inventory", width=120, fg_color="#34495E")
        self.btn_inv.grid(row=1, column=2, padx=20)
        
        # --- Footer: Save/Exit ---
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=3, column=0, columnspan=2, padx=20, pady=(0, 20), sticky="ew")
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Confirm NPC Data", command=self.save_and_exit, 
                                     font=self.button_font, fg_color="#27AE60", height=45)
        self.btn_ok.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Discard", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=45)
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
        self.name_input.insert(0, self.data.get("name", ""))
        self.align_btn.set(self.data.get("alignment", "Neutral"))
        self.activity_combo.set(self.data.get("activity", "Wander"))
        self.shop_combo.set(self.data.get("shop", "None"))
        
        # Populate attributes
        for attr, entry in self.attr_inputs.items():
            entry.insert(0, str(self.data.get(attr.lower(), "10")))
        for vit, entry in self.vit_inputs.items():
            entry.insert(0, str(self.data.get(vit.lower().replace(" ", ""), "100")))

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "alignment": self.align_btn.get(),
            "activity": self.activity_combo.get(),
            "shop": self.shop_combo.get(),
            "status": "ok"
        }
        # Add dynamic fields...
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NPCDialogGUI(path)
    app.mainloop()
