import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class NewProjectGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Create New Dransik Project", width=480, height=300)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(1, weight=1)
        
        # Header
        self.header = ctk.CTkFrame(self, fg_color="transparent")
        self.header.grid(row=0, column=0, padx=20, pady=(20, 10), sticky="ew")
        ctk.CTkLabel(self.header, text="Select Development Template", font=self.header_font).pack(side="left")
        
        # Content (List + Side Buttons)
        self.content = ctk.CTkFrame(self, fg_color="transparent")
        self.content.grid(row=1, column=0, padx=20, pady=10, sticky="nsew")
        self.content.grid_columnconfigure(0, weight=1)
        
        # Project types list
        self.project_list = ctk.CTkScrollableFrame(self.content, fg_color="#1a1a1a", border_width=1, border_color="#333333")
        self.project_list.grid(row=0, column=0, sticky="nsew", padx=(0, 10))
        
        self.templates = ["Standard RPG World", "Minimal Sandbox", "Dransik ClassiK Remaster", "Custom Scripting Environment"]
        for tmpl in self.templates:
            btn = ctk.CTkButton(self.project_list, text=tmpl, font=self.label_font, anchor="w", fg_color="transparent", hover_color="#222222")
            btn.pack(fill="x", pady=2, padx=5)
            
        # Side Actions
        self.side_actions = ctk.CTkFrame(self.content, fg_color="transparent")
        self.side_actions.grid(row=0, column=1, sticky="ns")
        
        self.btn_ok = ctk.CTkButton(self.side_actions, text="Initialize", command=self.save_and_exit, 
                                     width=100, font=self.button_font, fg_color="#27AE60")
        self.btn_ok.pack(pady=5)
        
        self.btn_cancel = ctk.CTkButton(self.side_actions, text="Cancel", command=self.destroy, 
                                        width=100, font=self.button_font, fg_color="#7F8C8D")
        self.btn_cancel.pack(pady=5)
        
        self.btn_help = ctk.CTkButton(self.side_actions, text="Help Docs", command=lambda: print("HELP"), 
                                      width=100, font=self.button_font, fg_color="#34495E")
        self.btn_help.pack(side="bottom", pady=5)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=2, column=0, pady=20, padx=20, sticky="ew")
        self.btn_done = ctk.CTkButton(self.footer, text="Confirm Selection", command=self.save_and_exit, 
                                      font=self.button_font, height=40)
        self.btn_done.pack(fill="x")

    def load_data(self):
        if self.data_path and os.path.exists(self.data_path):
            try:
                with open(self.data_path, 'r') as f:
                    return json.load(f)
            except: return None
        return None

    def save_and_exit(self):
        output = {"template": "Standard RPG World", "status": "ok"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = NewProjectGUI(path)
    app.mainloop()
