import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ShopItemsGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Shop Item Catalog", width=420, height=650)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        
        # Search Header
        self.search_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.search_frame.grid(row=0, column=0, padx=20, pady=20, sticky="ew")
        
        self.search_input = ctk.CTkEntry(self.search_frame, placeholder_text="Search items...", height=35)
        self.search_input.pack(fill="x")
        
        # List View
        self.list_frame = ctk.CTkFrame(self, fg_color="#111111", corner_radius=15, border_width=1, border_color="#333333")
        self.list_frame.grid(row=1, column=0, padx=20, pady=(0, 20), sticky="nsew")
        
        self.items_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent")
        self.items_scroll.pack(fill="both", expand=True, padx=5, pady=5)
        
        # Placeholder items
        self.items = ["Short Sword", "Long Sword", "Broadsword", "Shield", "Chainmail", "Lesser Potion", "Greater Potion", "Mana Scroll", "Teleport Rune", "Gold Bag", "Silver Key", "Iron Key"]
        for itm in self.items:
            btn = ctk.CTkButton(self.items_scroll, text=itm, font=self.label_font, anchor="w", 
                                fg_color="transparent", hover_color="#222222", height=38,
                                command=lambda i=itm: self.select_item(i))
            btn.pack(fill="x", pady=1)
            
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, pady=(0, 20), padx=20, sticky="ew")
        
        self.btn_select = ctk.CTkButton(self.footer, text="Select Item", command=self.save_and_exit, 
                                        font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_select.pack(side="left", expand=True, padx=5)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=40)
        self.btn_cancel.pack(side="right", expand=True, padx=5)

        self.selected_item = None

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def select_item(self, name):
        self.selected_item = name

    def save_and_exit(self):
        output = {"selected": self.selected_item, "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ShopItemsGUI(path)
    app.mainloop()
