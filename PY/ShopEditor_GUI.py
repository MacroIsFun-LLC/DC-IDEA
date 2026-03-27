import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ShopEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Merchant Shop Editor", width=620, height=520)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Header: Merchant Name
        self.name_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.name_frame.pack(fill="x", padx=10, pady=10)
        ctk.CTkLabel(self.name_frame, text="Merchant Name:", font=self.label_font).pack(side="left", padx=10)
        self.name_input = ctk.CTkEntry(self.name_frame, width=300)
        self.name_input.pack(side="left", padx=10)
        
        # Content Layout (Left: List, Right: Controls)
        self.content_row = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.content_row.pack(fill="both", expand=True, padx=10, pady=10)
        
        # Inventory List
        self.list_frame = ctk.CTkFrame(self.content_row)
        self.list_frame.pack(side="left", fill="both", expand=True, padx=(0, 10))
        ctk.CTkLabel(self.list_frame, text="Standing Inventory", font=self.button_font).pack(pady=5)
        
        self.item_list = ctk.CTkScrollableFrame(self.list_frame, fg_color="#1a1a1a")
        self.item_list.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        self.item_rows = []
        
        # Controls (Right)
        self.controls = ctk.CTkFrame(self.content_row, width=200)
        self.controls.pack(side="right", fill="y")
        
        ctk.CTkLabel(self.controls, text="Quantity:", font=self.label_font).pack(pady=(20, 5))
        self.qty_input = ctk.CTkEntry(self.controls, width=80)
        self.qty_input.insert(0, "1")
        self.qty_input.pack(pady=5)
        
        self.btn_add = ctk.CTkButton(self.controls, text="Add Item", command=self.add_item, 
                                     fg_color="#27AE60", hover_color="#2ECC71")
        self.btn_add.pack(pady=10, padx=20)
        
        self.btn_remove = ctk.CTkButton(self.controls, text="Remove Selected", command=self.remove_item, 
                                        fg_color="#C0392B", hover_color="#E74C3C")
        self.btn_remove.pack(pady=10, padx=20)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=20, padx=20)
        
        self.btn_ok = ctk.CTkButton(self.footer, text="Save Shop Data", command=self.save_and_exit, 
                                    font=self.button_font, fg_color="#2980B9", height=35)
        self.btn_ok.pack(side="left", expand=True, padx=10)
        
        self.btn_cancel = ctk.CTkButton(self.footer, text="Cancel", command=self.destroy, 
                                        font=self.button_font, fg_color="#7F8C8D", height=35)
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
        self.name_input.insert(0, self.data.get("merchant_name", ""))
        for item in self.data.get("inventory", []):
            self.add_item_row(item["name"], item["qty"])

    def add_item_row(self, name, qty):
        row = ctk.CTkFrame(self.item_list, fg_color="transparent")
        row.pack(fill="x", pady=2)
        lbl = ctk.CTkLabel(row, text=f"{name} (x{qty})", font=self.label_font, anchor="w")
        lbl.pack(side="left", padx=10, fill="x", expand=True)
        self.item_rows.append({"frame": row, "name": name, "qty": qty})

    def add_item(self):
        # Placeholder for item selection logic
        self.add_item_row("New Item", self.qty_input.get())

    def remove_item(self):
        if self.item_rows:
            row = self.item_rows.pop()
            row["frame"].destroy()

    def save_and_exit(self):
        output = {
            "merchant_name": self.name_input.get(),
            "inventory": [{"name": r["name"], "qty": r["qty"]} for r in self.item_rows]
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ShopEditorGUI(path)
    app.mainloop()
