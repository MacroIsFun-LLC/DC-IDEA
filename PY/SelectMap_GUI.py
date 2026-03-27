import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class SelectMapGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Select A Map - Dransik Editor", width=600, height=550)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Header Prompt
        self.prompt = ctk.CTkLabel(self.main_frame, text="Please Select a Map to Open", 
                                   font=self.header_font, fg_color="#1a1a1a", corner_radius=10, height=50)
        self.prompt.pack(fill="x", padx=20, pady=20)
        
        # Search Bar
        self.search_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.search_frame.pack(fill="x", padx=20, pady=(0, 10))
        self.search_input = ctk.CTkEntry(self.search_frame, placeholder_text="Filter maps...", height=35)
        self.search_input.pack(fill="x")
        
        # Map List
        self.list_frame = ctk.CTkFrame(self.main_frame, fg_color="#111111", corner_radius=10)
        self.list_frame.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        
        self.maps_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent")
        self.maps_scroll.pack(fill="both", expand=True, padx=10, pady=10)
        
        self.map_items = ["World Map (Global)", "Newbie Island", "Dungeon of Sorrow", "Royal City", "Desert Outpost", "Frozen Tundra"]
        for map_name in self.map_items:
            btn = ctk.CTkButton(self.maps_scroll, text=map_name, font=self.label_font, 
                                anchor="w", fg_color="transparent", hover_color="#222222", 
                                height=40, command=lambda m=map_name: self.map_selected(m))
            btn.pack(fill="x", pady=2)
            
        # Footer Actions
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=(0, 20), padx=20)
        
        self.btn_new = ctk.CTkButton(self.footer, text="+ New Map", command=self.create_new, 
                                     font=self.button_font, fg_color="#27AE60", width=120, height=40)
        self.btn_new.pack(side="left")
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", width=120, height=40)
        self.btn_cancel.pack(side="right")

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def map_selected(self, name):
        self.selected_map = name
        self.save_and_exit()

    def create_new(self):
        # Trigger 'New' action back in AutoIt
        output = {"action": "new", "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS: NEW")
        self.destroy()

    def save_and_exit(self):
        output = {"selected": self.selected_map, "action": "open", "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = SelectMapGUI(path)
    app.mainloop()
