import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class EncounterNameGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Encounter Table Registry", width=420, height=720)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(2, weight=1)
        
        # Header
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, padx=20, pady=20, sticky="ew")
        
        ctk.CTkLabel(self.header, text="Encounter Tables:", font=self.header_font).pack(side="left")
        self.btn_new = ctk.CTkButton(self.header, text="+ Create New", font=self.button_font, fg_color="#27AE60", width=120, command=self.create_new)
        self.btn_new.pack(side="right")
        
        # Search
        self.search_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.search_frame.grid(row=1, column=0, padx=20, pady=(0, 10), sticky="ew")
        self.search_input = ctk.CTkEntry(self.search_frame, placeholder_text="Filter registry...", height=35)
        self.search_input.pack(fill="x")
        
        # List View
        self.list_frame = ctk.CTkFrame(self, fg_color="#111111", corner_radius=15, border_width=1, border_color="#333333")
        self.list_frame.grid(row=2, column=0, padx=20, pady=(0, 20), sticky="nsew")
        
        self.tables_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent")
        self.tables_scroll.pack(fill="both", expand=True, padx=5, pady=5)
        
        # Placeholder tables
        self.tables = ["Forest Predators", "Desert Raiders", "Cave Dwellers", "Ocean Mercenaries", "Royal Guards", "Undead Horde", "Goblin Clan", "Orc Battalion"]
        for t in self.tables:
            btn = ctk.CTkButton(self.tables_scroll, text=t, font=self.label_font, anchor="w", 
                                fg_color="transparent", hover_color="#222222", height=40,
                                command=lambda name=t: self.select_table(name))
            btn.pack(fill="x", pady=1)
            
        # Selection Indicator
        self.indicator = ctk.CTkFrame(self, fg_color="#1a1a1a", height=60, corner_radius=10)
        self.indicator.grid(row=3, column=0, padx=20, pady=(0, 20), sticky="ew")
        self.indicator.pack_propagate(False)
        
        ctk.CTkLabel(self.indicator, text="Active Selection:", font=self.label_font).pack(side="left", padx=20)
        self.selection_label = ctk.CTkLabel(self.indicator, text="None", font=self.button_font, text_color="#3498DB")
        self.selection_label.pack(side="left")
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Finalize Selection", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=45)
        self.btn_done.pack(side="bottom", fill="x", padx=20, pady=(0, 20))

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def select_table(self, name):
        self.selection_label.configure(text=name)
        self.current_selection = name

    def create_new(self):
        output = {"action": "new", "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS: NEW")
        self.destroy()

    def save_and_exit(self):
        output = {"selected": self.selection_label.cget("text"), "action": "open", "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = EncounterNameGUI(path)
    app.mainloop()
