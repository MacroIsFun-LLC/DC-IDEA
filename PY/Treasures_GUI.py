import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class TreasuresGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Treasure Distribution Editor", width=750, height=620)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Grid layout
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # --- Left: Treasure Types ---
        self.types_frame = ctk.CTkFrame(self, width=220, corner_radius=0)
        self.types_frame.grid(row=0, column=0, rowspan=2, sticky="nsew")
        ctk.CTkLabel(self.types_frame, text="Treasure Types", font=self.header_font).pack(pady=20, padx=20)
        
        self.types_list = ctk.CTkScrollableFrame(self.types_frame, fg_color="#1a1a1a")
        self.types_list.pack(fill="both", expand=True, padx=15, pady=(0, 15))
        
        self.btn_add_type = ctk.CTkButton(self.types_frame, text="Add Type", height=30, fg_color="#2980B9")
        self.btn_add_type.pack(pady=5, padx=15, fill="x")
        self.btn_del_type = ctk.CTkButton(self.types_frame, text="Remove Type", height=30, fg_color="#7F8C8D")
        self.btn_del_type.pack(pady=5, padx=15, fill="x")
        
        # --- Right: Type Properties & Table ---
        self.detail_frame = ctk.CTkFrame(self, corner_radius=15)
        self.detail_frame.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.detail_frame, text="Drop Table Configuration", font=self.button_font).pack(pady=10)
        
        # Items Table
        self.table_frame = ctk.CTkFrame(self.detail_frame, fg_color="#111111")
        self.table_frame.pack(fill="both", expand=True, padx=20, pady=10)
        
        self.treasure_list = ctk.CTkScrollableFrame(self.table_frame, fg_color="transparent")
        self.treasure_list.pack(fill="both", expand=True, padx=5, pady=5)
        
        self.btn_add_tre = ctk.CTkButton(self.detail_frame, text="Add Treasure Item", width=200, height=35, fg_color="#27AE60")
        self.btn_add_tre.pack(pady=10)
        
        # Probability Configurator (Modernized version of the "There is a X%..." sentence)
        self.prob_frame = ctk.CTkFrame(self.detail_frame)
        self.prob_frame.pack(fill="x", padx=20, pady=20)
        
        ctk.CTkLabel(self.prob_frame, text="Drop Logic:", font=self.button_font).pack(pady=10, padx=10, anchor="w")
        
        row1 = ctk.CTkFrame(self.prob_frame, fg_color="transparent")
        row1.pack(fill="x", padx=20, pady=5)
        ctk.CTkLabel(row1, text="Spawn Chance:", font=self.label_font).pack(side="left")
        self.chance_input = ctk.CTkEntry(row1, width=60)
        self.chance_input.pack(side="left", padx=10)
        ctk.CTkLabel(row1, text="%", font=self.label_font).pack(side="left")
        
        row2 = ctk.CTkFrame(self.prob_frame, fg_color="transparent")
        row2.pack(fill="x", padx=20, pady=5)
        ctk.CTkLabel(row2, text="Quantity Range:", font=self.label_font).pack(side="left")
        self.qty_min = ctk.CTkEntry(row2, width=50)
        self.qty_min.pack(side="left", padx=10)
        ctk.CTkLabel(row2, text="to", font=self.label_font).pack(side="left")
        self.qty_max = ctk.CTkEntry(row2, width=50)
        self.qty_max.pack(side="left", padx=10)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=1, pady=10, padx=20, sticky="ew")
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Save Treasure Data", command=self.save_and_exit, 
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
        self.chance_input.insert(0, str(self.data.get("chance", "0")))
        self.qty_min.insert(0, str(self.data.get("min", "1")))
        self.qty_max.insert(0, str(self.data.get("max", "1")))
        
        # Mocking list population
        for item in self.data.get("items", []):
            ctk.CTkLabel(self.treasure_list, text=f"• {item}", font=self.label_font, anchor="w").pack(fill="x", padx=10, pady=2)

    def save_and_exit(self):
        output = {
            "chance": self.chance_input.get(),
            "min": self.qty_min.get(),
            "max": self.qty_max.get(),
            "items": ["Gold Coins", "Silver Ring"] # Mocked list
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = TreasuresGUI(path)
    app.mainloop()
