import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class EncounterTablesGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Encounter Tables Manager", width=850, height=600)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Grid layout (Master-Detail)
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(1, weight=1)
        
        # --- Header: Global Settings ---
        self.header = ctk.CTkFrame(self)
        self.header.grid(row=0, column=0, columnspan=2, padx=20, pady=20, sticky="ew")
        
        ctk.CTkLabel(self.header, text="Table Name:", font=self.label_font).pack(side="left", padx=(20, 10))
        self.table_name = ctk.CTkEntry(self.header, width=200)
        self.table_name.pack(side="left", padx=5)
        
        ctk.CTkLabel(self.header, text="Rate:", font=self.label_font).pack(side="left", padx=(20, 5))
        self.rate_input = ctk.CTkEntry(self.header, width=60)
        self.rate_input.pack(side="left")
        
        ctk.CTkLabel(self.header, text="Chance:", font=self.label_font).pack(side="left", padx=(20, 5))
        self.chance_input = ctk.CTkEntry(self.header, width=60)
        self.chance_input.pack(side="left")
        
        # --- Left: Master List ---
        self.list_frame = ctk.CTkFrame(self, width=250)
        self.list_frame.grid(row=1, column=0, padx=(20, 10), pady=(0, 20), sticky="nsew")
        ctk.CTkLabel(self.list_frame, text="Available Tables", font=self.button_font).pack(pady=10)
        
        self.tables_list = ctk.CTkScrollableFrame(self.list_frame, fg_color="#1a1a1a")
        self.tables_list.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        self.btn_new = ctk.CTkButton(self.list_frame, text="New Table", height=32, fg_color="#27AE60")
        self.btn_new.pack(pady=5, padx=10, fill="x")
        self.btn_del = ctk.CTkButton(self.list_frame, text="Delete Table", height=32, fg_color="#C0392B")
        self.btn_del.pack(pady=5, padx=10, fill="x")
        
        # --- Right: Detail Panel ---
        self.detail_frame = ctk.CTkFrame(self)
        self.detail_frame.grid(row=1, column=1, padx=(10, 20), pady=(0, 20), sticky="nsew")
        ctk.CTkLabel(self.detail_frame, text="Specific Encounter Data", font=self.button_font).pack(pady=10)
        
        # Encounter Name & Max Num
        self.config_row = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.config_row.pack(fill="x", padx=20, pady=10)
        ctk.CTkLabel(self.config_row, text="Encounter:", font=self.label_font).pack(side="left")
        self.enc_name = ctk.CTkEntry(self.config_row, width=180)
        self.enc_name.pack(side="left", padx=10)
        
        ctk.CTkLabel(self.config_row, text="Max Num:", font=self.label_font).pack(side="left", padx=(10, 5))
        self.max_num = ctk.CTkEntry(self.config_row, width=60)
        self.max_num.pack(side="left")
        
        # NPC Slots
        self.slots_frame = ctk.CTkFrame(self.detail_frame, fg_color="transparent")
        self.slots_frame.pack(fill="both", expand=True, padx=20, pady=10)
        ctk.CTkLabel(self.slots_frame, text="Spawn Configuration (NPC List)", font=self.label_font).pack(pady=(0, 10), anchor="w")
        
        self.npc_slots = []
        for i in range(4):
            row = ctk.CTkFrame(self.slots_frame, fg_color="#222222")
            row.pack(fill="x", pady=2)
            btn = ctk.CTkButton(row, text="Select NPC", width=100, font=self.label_font)
            btn.pack(side="left", padx=5, pady=5)
            entry = ctk.CTkEntry(row, placeholder_text="No NPC Selected", height=28)
            entry.pack(side="left", padx=5, pady=5, fill="x", expand=True)
            entry.configure(state="readonly")
            self.npc_slots.append(entry)
            
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, columnspan=2, pady=10, padx=20, sticky="ew")
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Save Batch Changes", command=self.save_and_exit, 
                                     font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_ok.pack(side="left", expand=True, padx=10)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
        self.btn_cancel.pack(side="right", expand=True, padx=10)

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
        self.table_name.insert(0, self.data.get("table_name", ""))
        self.rate_input.insert(0, str(self.data.get("rate", "")))
        self.chance_input.insert(0, str(self.data.get("chance", "")))
        
        detail = self.data.get("detail", {})
        self.enc_name.insert(0, detail.get("name", ""))
        self.max_num.insert(0, str(detail.get("max_num", "")))
        
        npcs = detail.get("npcs", [])
        for i, npc_name in enumerate(npcs):
            if i < len(self.npc_slots):
                self.npc_slots[i].configure(state="normal")
                self.npc_slots[i].insert(0, npc_name)
                self.npc_slots[i].configure(state="readonly")

    def save_and_exit(self):
        output = {
            "table_name": self.table_name.get(),
            "rate": self.rate_input.get(),
            "chance": self.chance_input.get(),
            "detail": {
                "name": self.enc_name.get(),
                "max_num": self.max_num.get(),
                "npcs": [slot.get() for slot in self.npc_slots if slot.get()]
            }
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = EncounterTablesGUI(path)
    app.mainloop()
