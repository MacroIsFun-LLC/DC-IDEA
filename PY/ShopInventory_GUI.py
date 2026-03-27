import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ShopInventoryGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Merchant Stock Management", width=620, height=580)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        
        # Header: Merchant Info
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, padx=20, pady=(20, 10), sticky="ew")
        
        ctk.CTkLabel(self.header, text="Merchant:", font=self.label_font).pack(side="left")
        self.merchant_input = ctk.CTkEntry(self.header, width=300, state="readonly")
        self.merchant_input.pack(side="left", padx=10)
        
        # Content: Split View
        self.content = ctk.CTkFrame(self, fg_color="transparent")
        self.content.grid(row=1, column=0, padx=20, pady=10, sticky="nsew")
        self.content.grid_columnconfigure(0, weight=3)
        self.content.grid_columnconfigure(1, weight=1)
        
        # Left: Inventory List
        self.list_frame = ctk.CTkFrame(self.content, fg_color="#111111", corner_radius=10)
        self.list_frame.grid(row=0, column=0, sticky="nsew", padx=(0, 10))
        
        ctk.CTkLabel(self.list_frame, text="Standing Stock", font=self.button_font).pack(pady=10)
        self.inventory_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="transparent")
        self.inventory_scroll.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        # Right: Item Controls
        self.controls = ctk.CTkFrame(self.content, corner_radius=15)
        self.controls.grid(row=0, column=1, sticky="nsew")
        
        ctk.CTkLabel(self.controls, text="Quantity", font=self.label_font).pack(pady=(20, 5))
        self.qty_input = ctk.CTkEntry(self.controls, width=80, justify="center")
        self.qty_input.pack(pady=5)
        self.qty_input.insert(0, "1")
        
        self.btn_add = ctk.CTkButton(self.controls, text="Add Item", fg_color="#27AE60", height=35)
        self.btn_add.pack(pady=(20, 5), padx=15, fill="x")
        
        self.btn_remove = ctk.CTkButton(self.controls, text="Remove", fg_color="#C0392B", height=35)
        self.btn_remove.pack(pady=5, padx=15, fill="x")
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, pady=20, padx=20, sticky="ew")
        
        self.btn_save = ctk.CTkButton(self.footer, text="Confirm Inventory Changes", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_save.pack(side="left", expand=True, padx=5)
        
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
        self.merchant_input.configure(state="normal")
        self.merchant_input.insert(0, self.data.get("merchant", "General Store"))
        self.merchant_input.configure(state="readonly")
        
        stock = self.data.get("stock", [])
        for item in stock:
            btn = ctk.CTkButton(self.inventory_scroll, text=f"{item['name']} (x{item['qty']})", 
                                anchor="w", fg_color="transparent", hover_color="#222222")
            btn.pack(fill="x", pady=1)

    def save_and_exit(self):
        output = {"status": "updated", "merchant": self.merchant_input.get()}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ShopInventoryGUI(path)
    app.mainloop()
