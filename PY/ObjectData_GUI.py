import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI
from PIL import Image

class ObjectDataGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Object Properties & Data", width=480, height=320)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(1, weight=1)
        
        # --- Left: Preview Panel ---
        self.preview_frame = ctk.CTkFrame(self, width=120)
        self.preview_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.preview_frame, text="Preview", font=self.label_font).pack(pady=5)
        
        # Image Box
        self.image_box = ctk.CTkLabel(self.preview_frame, text="", width=80, height=80, fg_color="#111111", corner_radius=5)
        self.image_box.pack(pady=10)
        
        # ID Field
        ctk.CTkLabel(self.preview_frame, text="Object ID:", font=ctk.CTkFont(size=10)).pack()
        self.id_input = ctk.CTkEntry(self.preview_frame, width=80, height=24, state="readonly", justify="center")
        self.id_input.pack(pady=5)
        
        # --- Right: Data Panel ---
        self.data_frame = ctk.CTkFrame(self, corner_radius=15)
        self.data_frame.grid(row=0, column=1, padx=(0, 20), pady=20, sticky="nsew")
        
        # Stats
        self.stats_row = ctk.CTkFrame(self.data_frame, fg_color="transparent")
        self.stats_row.pack(fill="x", padx=20, pady=15)
        
        ctk.CTkLabel(self.stats_row, text="Health:", font=self.label_font).grid(row=0, column=0, pady=5, sticky="w")
        self.health_input = ctk.CTkEntry(self.stats_row, width=80)
        self.health_input.grid(row=0, column=1, padx=10, pady=5)
        
        ctk.CTkLabel(self.stats_row, text="Quality:", font=self.label_font).grid(row=1, column=0, pady=5, sticky="w")
        self.quality_input = ctk.CTkEntry(self.stats_row, width=80)
        self.quality_input.grid(row=1, column=1, padx=10, pady=5)
        
        # Flags
        self.flag_frame = ctk.CTkFrame(self.data_frame)
        self.flag_frame.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        ctk.CTkLabel(self.flag_frame, text="Security & Status", font=self.button_font).pack(pady=5)
        
        self.check_secure = ctk.CTkCheckBox(self.flag_frame, text="Object is Secure", font=self.label_font)
        self.check_secure.pack(pady=5, padx=20, anchor="w")
        
        self.check_blessed = ctk.CTkCheckBox(self.flag_frame, text="Object is Blessed", font=self.label_font)
        self.check_blessed.pack(pady=5, padx=20, anchor="w")
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Apply Changes", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=35)
        self.btn_done.grid(row=1, column=0, columnspan=2, pady=(0, 20), padx=20, sticky="ew")

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
        self.id_input.configure(state="normal")
        self.id_input.insert(0, str(self.data.get("id", "0")))
        self.id_input.configure(state="readonly")
        
        self.health_input.insert(0, str(self.data.get("health", "")))
        self.quality_input.insert(0, str(self.data.get("quality", "")))
        if self.data.get("secure"): self.check_secure.select()
        if self.data.get("blessed"): self.check_blessed.select()

    def save_and_exit(self):
        output = {
            "id": self.id_input.get(),
            "health": self.health_input.get(),
            "quality": self.quality_input.get(),
            "secure": self.check_secure.get(),
            "blessed": self.check_blessed.get()
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ObjectDataGUI(path)
    app.mainloop()
