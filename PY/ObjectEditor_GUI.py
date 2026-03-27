import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ObjectEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Object Asset Editor", width=420, height=360)
        self.data_path = data_path
        
        # Main Layout
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Viewport Header
        ctk.CTkLabel(self.main_frame, text="Current Object Asset View", font=self.button_font).pack(pady=(10, 5))
        
        # Large Viewport Layer
        self.viewport = ctk.CTkFrame(self.main_frame, fg_color="#0a0a0a", corner_radius=10, border_width=1, border_color="#333333")
        self.viewport.pack(fill="both", expand=True, padx=15, pady=10)
        
        # Placeholder indicator
        self.canvas = ctk.CTkCanvas(self.viewport, bg="#0a0a0a", highlightthickness=0)
        self.canvas.pack(fill="both", expand=True)
        self.canvas.create_text(190, 90, text="[ Object Visualization Layer ]", fill="#222222", font=("Inter", 16, "bold"))
        
        # Copyright / Footer Info
        self.footer_info = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.footer_info.pack(fill="x", side="bottom", pady=10, padx=15)
        
        ctk.CTkLabel(self.footer_info, text="Copyright © 1999 Asylumsoft", font=ctk.CTkFont(size=10, slant="italic"), text_color="#555555").pack(side="left")
        
        self.btn_ok = ctk.CTkButton(self.footer_info, text="Close View", command=self.destroy, 
                                    width=100, height=32, font=self.button_font, fg_color="#34495E")
        self.btn_ok.pack(side="right")

if __name__ == "__main__":
    app = ObjectEditorGUI()
    app.mainloop()
