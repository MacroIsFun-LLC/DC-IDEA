import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class EncounterTableGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Encounter Probability Configuration", width=550, height=480)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Header: Name & Basic Stats
        self.header = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.header.pack(fill="x", padx=20, pady=15)
        
        ctk.CTkLabel(self.header, text="Table Name:", font=self.label_font).grid(row=0, column=0, sticky="w")
        self.name_input = ctk.CTkEntry(self.header, width=250)
        self.name_input.grid(row=0, column=1, columnspan=3, padx=10, pady=5, sticky="w")
        
        ctk.CTkLabel(self.header, text="Spawn Rate:", font=self.label_font).grid(row=1, column=0, sticky="w")
        self.rate_input = ctk.CTkEntry(self.header, width=80)
        self.rate_input.grid(row=1, column=1, padx=10, pady=5, sticky="w")
        
        ctk.CTkLabel(self.header, text="Chance:", font=self.label_font).grid(row=1, column=2, sticky="w")
        self.chance_input = ctk.CTkEntry(self.header, width=80)
        self.chance_input.grid(row=1, column=3, padx=10, pady=5, sticky="w")
        
        # Middle: Lists
        self.middle = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.middle.pack(fill="both", expand=True, padx=20, pady=5)
        self.middle.grid_columnconfigure(0, weight=3)
        self.middle.grid_columnconfigure(1, weight=1)
        
        self.list_frame = ctk.CTkFrame(self.middle, fg_color="#111111", corner_radius=10)
        self.list_frame.grid(row=0, column=0, sticky="nsew", padx=(0, 10))
        
        ctk.CTkLabel(self.list_frame, text="Active Encounter Profile", font=self.button_font).pack(pady=5)
        self.enc_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent", height=150)
        self.enc_scroll.pack(fill="both", expand=True, padx=5, pady=(0, 5))
        
        self.btn_panel = ctk.CTkFrame(self.middle, fg_color="transparent")
        self.btn_panel.grid(row=0, column=1, sticky="nsew")
        
        self.btn_new = ctk.CTkButton(self.btn_panel, text="+ Add", fg_color="#27AE60", height=32)
        self.btn_new.pack(fill="x", pady=5)
        
        self.btn_del = ctk.CTkButton(self.btn_panel, text="- Remove", fg_color="#C0392B", height=32)
        self.btn_del.pack(fill="x", pady=5)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=20, padx=20)
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Confirm Table", command=self.save_and_exit, 
                                     font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_ok.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Discard", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
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
        self.name_input.insert(0, self.data.get("name", "New Encounter Table"))
        self.rate_input.insert(0, str(self.data.get("rate", "100")))
        self.chance_input.insert(0, str(self.data.get("chance", "5")))
        
        encounters = self.data.get("encounters", ["Default Spawn"])
        for e in encounters:
            btn = ctk.CTkButton(self.enc_scroll, text=e, anchor="w", fg_color="transparent", hover_color="#222222")
            btn.pack(fill="x", pady=1)

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "rate": self.rate_input.get(),
            "chance": self.chance_input.get(),
            "status": "ok"
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = EncounterTableGUI(path)
    app.mainloop()
