import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ChunktypeGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Map Chunk Editor", width=350, height=520)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        
        # --- Group 1: Current Chunk ---
        self.current_frame = ctk.CTkFrame(self, corner_radius=15, border_width=1)
        self.current_frame.pack(padx=20, pady=20, fill="x")
        
        ctk.CTkLabel(self.current_frame, text="Current Chunk Status", font=self.button_font).pack(pady=10)
        
        self.curr_checks = {}
        for prop in ["Newbie Zone", "Safe Zone", "Arena Zone", "Player Owned"]:
            cb = ctk.CTkCheckBox(self.current_frame, text=prop, font=self.label_font)
            cb.pack(pady=5, padx=20, anchor="w")
            self.curr_checks[prop] = cb
            
        # --- Paint Mode Button ---
        self.btn_paint = ctk.CTkButton(self, text="Toggle Global Paint Mode", font=self.button_font, 
                                        fg_color="#D35400", hover_color="#E67E22", height=40)
        self.btn_paint.pack(padx=20, pady=5, fill="x")
        
        # --- Group 2: Paint Default ---
        self.default_frame = ctk.CTkFrame(self, corner_radius=15, border_width=1)
        self.default_frame.pack(padx=20, pady=20, fill="x")
        
        ctk.CTkLabel(self.default_frame, text="Painting Defaults", font=self.button_font).pack(pady=10)
        
        self.def_checks = {}
        for prop in ["Newbie Zone", "Safe Zone", "Arena Zone", "Player Owned"]:
            cb = ctk.CTkCheckBox(self.default_frame, text=prop, font=self.label_font)
            cb.pack(pady=5, padx=20, anchor="w")
            self.def_checks[prop] = cb
            
        # --- Footer ---
        self.btn_done = ctk.CTkButton(self, text="Apply Chunk Matrix", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_done.pack(side="bottom", fill="x", padx=20, pady=(0, 20))

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
        # Mock population logic
        pass

    def save_and_exit(self):
        output = {"status": "success", "mode": "paint_active"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ChunktypeGUI(path)
    app.mainloop()
