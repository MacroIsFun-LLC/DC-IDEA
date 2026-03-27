import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class RaceGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Racial Alignment & Constraints", width=550, height=580)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure((0, 1), weight=1)
        
        # --- Left: Race Registry ---
        self.left_col = ctk.CTkFrame(self, corner_radius=15)
        self.left_col.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.left_col, text="World Races", font=self.button_font).pack(pady=10)
        
        self.race_scroll = ctk.CTkScrollableFrame(self.left_col, fg_color="#111111", height=250)
        self.race_scroll.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        self.races = ["Human", "Elf", "Dwarf", "Orc", "Dark Elf", "Halfling"]
        for r in self.races:
            btn = ctk.CTkButton(self.race_scroll, text=r, anchor="w", fg_color="transparent", hover_color="#222222")
            btn.pack(fill="x", pady=1)
            
        self.btn_race_actions = ctk.CTkFrame(self.left_col, fg_color="transparent")
        self.btn_race_actions.pack(fill="x", pady=10, padx=10)
        ctk.CTkButton(self.btn_race_actions, text="+ New", width=80, fg_color="#27AE60").pack(side="left", expand=True, padx=2)
        ctk.CTkButton(self.btn_race_actions, text="- Del", width=80, fg_color="#C0392B").pack(side="left", expand=True, padx=2)
        
        # --- Right: Constraints ---
        self.right_col = ctk.CTkFrame(self, corner_radius=15, border_width=1)
        self.right_col.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.right_col, text="Attribute Constraints", font=self.button_font).pack(pady=10)
        
        self.grid_frame = ctk.CTkFrame(self.right_col, fg_color="transparent")
        self.grid_frame.pack(fill="both", expand=True, padx=20)
        
        # Labels
        ctk.CTkLabel(self.grid_frame, text="Min", font=ctk.CTkFont(slant="italic")).grid(row=0, column=1)
        ctk.CTkLabel(self.grid_frame, text="Max", font=ctk.CTkFont(slant="italic")).grid(row=0, column=2)
        
        self.inputs = {}
        attrs = ["STR", "INT", "DEX", "CON"]
        for i, attr in enumerate(attrs):
            ctk.CTkLabel(self.grid_frame, text=f"{attr}:", font=self.label_font).grid(row=i+1, column=0, padx=5, pady=10, sticky="w")
            min_e = ctk.CTkEntry(self.grid_frame, width=60, justify="center")
            min_e.grid(row=i+1, column=1, padx=5)
            max_e = ctk.CTkEntry(self.grid_frame, width=60, justify="center")
            max_e.grid(row=i+1, column=2, padx=5)
            self.inputs[attr] = (min_e, max_e)
            
        # --- Footer ---
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=0, columnspan=2, padx=20, pady=(0, 20), sticky="ew")
        
        self.btn_save = ctk.CTkButton(self.footer, text="Confirm Racial Data", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=45)
        self.btn_save.pack(side="left", expand=True, padx=5)
        
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
        # Logic to populate constraints
        for attr, (min_e, max_e) in self.inputs.items():
            min_e.insert(0, "5")
            max_e.insert(0, "25")

    def save_and_exit(self):
        output = {"status": "success", "race": "Human"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = RaceGUI(path)
    app.mainloop()
