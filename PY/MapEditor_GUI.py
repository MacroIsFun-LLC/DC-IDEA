import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class MapEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        # Map editor is usually larger
        super().__init__(title="Dransik Map Editor - Modernized", width=1100, height=700)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout (Sidebar + Canvas)
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # --- Sidebar: Tools ---
        self.sidebar = ctk.CTkFrame(self, width=220, corner_radius=0)
        self.sidebar.grid(row=0, column=0, sticky="nsew")
        
        ctk.CTkLabel(self.sidebar, text="Editor Tools", font=self.header_font).pack(pady=20, padx=20)
        
        self.btn_paint = self.add_tool_button("Paint Tiles", self.tool_paint)
        self.btn_erase = self.add_tool_button("Erase Tiles", self.tool_erase)
        self.btn_object = self.add_tool_button("Place Object", self.tool_object)
        
        # Space
        ctk.CTkLabel(self.sidebar, text="", height=20).pack()
        
        # Map Settings Group
        self.settings_frame = ctk.CTkFrame(self.sidebar, fg_color="transparent")
        self.settings_frame.pack(fill="x", padx=10, pady=10)
        ctk.CTkLabel(self.settings_frame, text="Grid Settings", font=self.button_font).pack(pady=5)
        
        self.check_grid = ctk.CTkCheckBox(self.settings_frame, text="Show Grid", font=self.label_font)
        self.check_grid.pack(pady=5, padx=20, anchor="w")
        self.check_grid.select()
        
        self.check_collision = ctk.CTkCheckBox(self.settings_frame, text="Show Collision", font=self.label_font)
        self.check_collision.pack(pady=5, padx=20, anchor="w")
        
        # Exit Button at bottom of sidebar
        self.btn_exit = ctk.CTkButton(self.sidebar, text="Close Editor", command=self.save_and_exit, 
                                      fg_color="#C0392B", hover_color="#922B21", font=self.button_font)
        self.btn_exit.pack(side="bottom", pady=20, padx=20, fill="x")
        
        # --- Main Area: Canvas ---
        self.canvas_container = ctk.CTkFrame(self, corner_radius=15, fg_color="#1a1a1a")
        self.canvas_container.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        self.canvas = ctk.CTkCanvas(self.canvas_container, bg="#000000", highlightthickness=0)
        self.canvas.pack(fill="both", expand=True, padx=2, pady=2)
        
        # Placeholder indicator
        self.canvas.create_text(400, 300, text="[ Map Viewport Layer ]", fill="#333333", font=("Inter", 24, "bold"))
        self.canvas.create_text(400, 340, text="Interactive tile logic integration pending", fill="#222222", font=("Inter", 12))

    def add_tool_button(self, text, command):
        btn = ctk.CTkButton(self.sidebar, text=text, command=command, font=self.button_font, 
                            height=40, anchor="w", fg_color="transparent", border_width=1)
        btn.pack(pady=5, padx=20, fill="x")
        return btn

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def save_and_exit(self):
        # Normally would save map state
        self.destroy()

    def tool_paint(self): self.status_msg("Painting Mode Active")
    def tool_erase(self): self.status_msg("Eraser Active")
    def tool_object(self): self.status_msg("Object Placement Active")
    
    def status_msg(self, msg):
        print(f"STATUS: {msg}")

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = MapEditorGUI(path)
    app.mainloop()
