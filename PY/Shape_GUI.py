import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ShapeGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Shape & Asset Manager", width=600, height=650)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=3)
        self.grid_columnconfigure(1, weight=1)
        
        # Left: Shape List
        self.list_frame = ctk.CTkFrame(self, corner_radius=15)
        self.list_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.list_frame, text="Active Shapes", font=self.button_font).pack(pady=10)
        self.shape_scroll = ctk.CTkScrollableFrame(self.list_frame, fg_color="#111111")
        self.shape_scroll.pack(fill="both", expand=True, padx=10, pady=(0, 10))
        
        # Placeholder shapes
        self.shapes = [f"Shape_{i:03d}" for i in range(1, 41)]
        for s in self.shapes:
            btn = ctk.CTkButton(self.shape_scroll, text=s, anchor="w", fg_color="transparent", hover_color="#222222")
            btn.pack(fill="x", pady=1)
            
        # Right: Action Panel
        self.action_panel = ctk.CTkFrame(self, corner_radius=15)
        self.action_panel.grid(row=0, column=1, padx=(0, 20), pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.action_panel, text="Asset Actions", font=self.label_font).pack(pady=15)
        
        actions = [
            ("Import", "#27AE60"),
            ("Delete", "#C0392B"),
            ("Capture", "#2980B9"),
            ("Re-Capture", "#2980B9"),
            ("Preview", "#8E44AD"),
            ("Rename", "#F39C12"),
            ("Export Palette", "#7F8C8D")
        ]
        
        for text, color in actions:
            btn = ctk.CTkButton(self.action_panel, text=text, fg_color=color, height=35)
            btn.pack(pady=5, padx=15, fill="x")
            
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=0, columnspan=2, padx=20, pady=(0, 20), sticky="ew")
        
        self.btn_done = ctk.CTkButton(self.footer, text="Exit Asset Manager", command=self.destroy, 
                                      font=self.button_font, fg_color="#34495E", height=45)
        self.btn_done.pack(fill="x")

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ShapeGUI(path)
    app.mainloop()
