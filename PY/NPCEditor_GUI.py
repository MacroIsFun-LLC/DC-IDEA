import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NPCEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="NPC Configuration Editor", width=620, height=560)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout (Left: Attributes, Right: Meta/Alignment)
        self.grid_columnconfigure(0, weight=1)
        self.grid_columnconfigure(1, weight=1)
        
        # Header: Name
        self.header_frame = ctk.CTkFrame(self, corner_radius=10)
        self.header_frame.grid(row=0, column=0, columnspan=2, padx=20, pady=20, sticky="ew")
        ctk.CTkLabel(self.header_frame, text="NPC Name:", font=self.label_font).pack(side="left", padx=20, pady=10)
        self.name_input = ctk.CTkEntry(self.header_frame, width=350, placeholder_text="Enter NPC moniker...")
        self.name_input.pack(side="left", padx=10, pady=10)
        
        # --- Left Column: Attributes ---
        self.attr_frame = ctk.CTkFrame(self, corner_radius=15)
        self.attr_frame.grid(row=1, column=0, padx=(20, 10), pady=(0, 20), sticky="nsew")
        ctk.CTkLabel(self.attr_frame, text="Core Statistics", font=self.button_font).pack(pady=10)
        
        self.attr_entries = {}
        attrs = ["Strength", "Intelligence", "Dexterity", "Constitution", "Health", "Max Health", "Level", "Mana", "Armorclass"]
        for attr in attrs:
            row = ctk.CTkFrame(self.attr_frame, fg_color="transparent")
            row.pack(fill="x", padx=15, pady=2)
            ctk.CTkLabel(row, text=f"{attr}:", font=ctk.CTkFont(size=11)).pack(side="left")
            entry = ctk.CTkEntry(row, width=80, height=24)
            entry.pack(side="right")
            self.attr_entries[attr] = entry
            
        # --- Right Column: Alignment & Meta ---
        self.meta_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.meta_frame.grid(row=1, column=1, padx=(10, 20), pady=(0, 20), sticky="nsew")
        
        # Alignment
        self.align_frame = ctk.CTkFrame(self.meta_frame)
        self.align_frame.pack(fill="x", pady=(0, 20), padx=5)
        ctk.CTkLabel(self.align_frame, text="Alignment", font=self.button_font).pack(pady=5)
        self.align_seg = ctk.CTkSegmentedButton(self.align_frame, values=["Good", "Neutral", "Evil"], font=self.label_font)
        self.align_seg.pack(pady=10, padx=10, fill="x")
        self.align_seg.set("Neutral")
        
        # Activity & Shop
        self.control_frame = ctk.CTkFrame(self.meta_frame)
        self.control_frame.pack(fill="x", pady=0, padx=5)
        
        ctk.CTkLabel(self.control_frame, text="Behavioral Settings", font=self.button_font).pack(pady=10)
        
        ctk.CTkLabel(self.control_frame, text="Activity Pattern:", font=self.label_font).pack(pady=(5, 0))
        self.activity_combo = ctk.CTkComboBox(self.control_frame, values=["Idle", "Wander", "Guarding", "Patrol"], width=200)
        self.activity_combo.pack(pady=5, padx=20)
        
        ctk.CTkLabel(self.control_frame, text="Merchant Type:", font=self.label_font).pack(pady=(15, 0))
        self.shop_combo = ctk.CTkComboBox(self.control_frame, values=["None", "Blacksmith", "Alchemist", "General Store"], width=200)
        self.shop_combo.pack(pady=5, padx=20)
        
        self.btn_inv = ctk.CTkButton(self.control_frame, text="Manage Inventory", command=self.placeholder_inv, 
                                     fg_color="#34495E", hover_color="#2C3E50")
        self.btn_inv.pack(pady=20, padx=20)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, columnspan=2, pady=10, padx=20, sticky="ew")
        
        self.btn_save = ctk.CTkButton(self.footer, text="Finalize & Save", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#27AE60", hover_color="#1E8449", height=40)
        self.btn_save.pack(side="left", expand=True, padx=10)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Discard", command=self.destroy, 
                                        font=self.button_font, fg_color="#C0392B", hover_color="#922B21", height=40)
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
        if not self.data: return
        self.name_input.insert(0, self.data.get("name", ""))
        self.align_seg.set(self.data.get("alignment", "Neutral"))
        self.activity_combo.set(self.data.get("activity", "Idle"))
        self.shop_combo.set(self.data.get("shop_type", "None"))
        
        stats = self.data.get("stats", {})
        for attr, entry in self.attr_entries.items():
            entry.insert(0, str(stats.get(attr, "0")))

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "alignment": self.align_seg.get(),
            "activity": self.activity_combo.get(),
            "shop_type": self.shop_combo.get(),
            "stats": {attr: entry.get() for attr, entry in self.attr_entries.items()}
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

    def placeholder_inv(self):
        print("OPEN_INVENTORY_SIGNAL")

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NPCEditorGUI(path)
    app.mainloop()
