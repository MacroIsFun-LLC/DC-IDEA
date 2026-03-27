import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NPCEncounterListGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Select NPC for Encounter", width=420, height=580)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        
        # Header
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, padx=20, pady=20, sticky="ew")
        ctk.CTkLabel(self.header, text="Choose an NPC from this list:", font=self.label_font).pack(side="left")
        
        # List View
        self.list_frame = ctk.CTkFrame(self, fg_color="#111111", corner_radius=15, border_width=1, border_color="#333333")
        self.list_frame.grid(row=1, column=0, padx=20, pady=(0, 20), sticky="nsew")
        
        self.npcs_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent")
        self.npcs_scroll.pack(fill="both", expand=True, padx=5, pady=5)
        
        # Placeholder NPCs
        self.npcs = ["Goblin Warrior", "Goblin Mage", "Orc Grunt", "Orc Shaman", "Skeleton", "Zombie", "Wraith", "Dark Knight", "Dragon Ling", "Troll"]
        for npc in self.npcs:
            btn = ctk.CTkButton(self.npcs_scroll, text=npc, font=self.label_font, anchor="w", 
                                fg_color="transparent", hover_color="#222222", height=40,
                                command=lambda n=npc: self.select_npc(n))
            btn.pack(fill="x", pady=1)
            
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, pady=(0, 20), padx=20, sticky="ew")
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Select NPC", command=self.save_and_exit, 
                                     font=self.button_font, fg_color="#27AE60", height=40)
        self.btn_ok.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
        self.btn_cancel.pack(side="right", expand=True, padx=5)

        self.selected_npc = None

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def select_npc(self, name):
        self.selected_npc = name

    def save_and_exit(self):
        output = {"selected": self.selected_npc, "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NPCEncounterListGUI(path)
    app.mainloop()
