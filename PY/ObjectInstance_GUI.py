import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ObjectInstanceGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Edit Map Object Instance", width=500, height=650)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        
        # --- Top: Visual Context ---
        self.visual_frame = ctk.CTkFrame(self, corner_radius=15)
        self.visual_frame.pack(padx=20, pady=20, fill="x")
        
        self.preview_box = ctk.CTkFrame(self.visual_frame, width=120, height=120, fg_color="#111111", border_width=1)
        self.preview_box.pack(pady=15)
        ctk.CTkLabel(self.preview_box, text="[ Sprite ]", font=self.label_font).place(relx=0.5, rely=0.5, anchor="center")
        
        self.type_input = ctk.CTkEntry(self.visual_frame, width=350, justify="center", state="readonly")
        self.type_input.pack(pady=(0, 15), padx=20)
        
        # --- Middle: Stats & Location ---
        self.stats_frame = ctk.CTkFrame(self, fg_color="transparent")
        self.stats_frame.pack(fill="x", padx=20)
        self.stats_frame.grid_columnconfigure((1, 3), weight=1)
        
        ctk.CTkLabel(self.stats_frame, text="Health:", font=self.label_font).grid(row=0, column=0, padx=10, pady=5)
        self.hp_input = ctk.CTkEntry(self.stats_frame, width=80)
        self.hp_input.grid(row=0, column=1, sticky="w", pady=5)
        
        ctk.CTkLabel(self.stats_frame, text="Map:", font=self.label_font).grid(row=0, column=2, padx=10, pady=5)
        self.map_input = ctk.CTkEntry(self.stats_frame, width=150, state="readonly")
        self.map_input.grid(row=0, column=3, sticky="we", pady=5, padx=(0, 10))
        
        # --- Properties Area ---
        ctk.CTkLabel(self, text="Overridden Instance Properties:", font=self.button_font).pack(pady=(20, 5), padx=25, anchor="w")
        self.prop_frame = ctk.CTkFrame(self, fg_color="#0a0a0a", corner_radius=15, border_width=1, border_color="#333333")
        self.prop_frame.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        
        self.text_props = ctk.CTkTextbox(self.prop_frame, font=("Consolas", 13), fg_color="transparent")
        self.text_props.pack(fill="both", expand=True, padx=10, pady=10)
        
        # --- Footer ---
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=(0, 20), padx=20)
        
        self.btn_save = ctk.CTkButton(self.footer, text="Apply Instance State", command=self.save_and_exit, 
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
        self.type_input.configure(state="normal")
        self.type_input.insert(0, self.data.get("type", "Wooden Crate"))
        self.type_input.configure(state="readonly")
        
        self.map_input.configure(state="normal")
        self.map_input.insert(0, self.data.get("map", "Wilderness_01"))
        self.map_input.configure(state="readonly")
        
        self.hp_input.insert(0, str(self.data.get("hp", "1000")))
        self.text_props.insert("1.0", self.data.get("props", "{\n  \"interactable\": true,\n  \"loot_table\": \"low_tier\"\n}"))

    def save_and_exit(self):
        output = {"status": "ok", "hp": self.hp_input.get()}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ObjectInstanceGUI(path)
    app.mainloop()
