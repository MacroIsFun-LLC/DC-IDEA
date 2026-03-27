import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class FactionsGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Faction Manager", width=480, height=450)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Frame
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Identity Row
        self.id_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.id_frame.pack(fill="x", padx=20, pady=20)
        
        ctk.CTkLabel(self.id_frame, text="Faction Name:", font=self.label_font).grid(row=0, column=0, sticky="w", pady=5)
        self.name_input = ctk.CTkEntry(self.id_frame, width=280)
        self.name_input.grid(row=0, column=1, padx=10, pady=5)
        
        ctk.CTkLabel(self.id_frame, text="Abbreviation:", font=self.label_font).grid(row=1, column=0, sticky="w", pady=5)
        self.abrev_input = ctk.CTkEntry(self.id_frame, width=80)
        self.abrev_input.grid(row=1, column=1, padx=10, pady=5, sticky="w")
        
        # Action Buttons
        self.action_frame = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.action_frame.pack(fill="x", padx=20, pady=10)
        
        self.btn_members = ctk.CTkButton(self.action_frame, text="Personnel / Members", command=self.open_members, 
                                         fg_color="#34495E", hover_color="#2C3E50", height=35)
        self.btn_members.pack(side="left", expand=True, padx=5)
        
        self.btn_titles = ctk.CTkButton(self.action_frame, text="Honors / Titles", command=self.open_titles, 
                                        fg_color="#34495E", hover_color="#2C3E50", height=35)
        self.btn_titles.pack(side="right", expand=True, padx=5)
        
        # Relationships / Assets Info Area
        ctk.CTkLabel(self.main_frame, text="Global Relationships & Assets", font=self.button_font).pack(pady=(20, 5))
        self.info_area = ctk.CTkFrame(self.main_frame, fg_color="#1a1a1a", corner_radius=10, border_width=1, border_color="#333333")
        self.info_area.pack(fill="both", expand=True, padx=20, pady=(0, 20))
        
        # Placeholder text
        ctk.CTkLabel(self.info_area, text="[ Inter-Faction Standing Data ]", font=ctk.CTkFont(size=12, slant="italic"), text_color="#444444").place(relx=0.5, rely=0.5, anchor="center")
        
        # Footer
        self.btn_done = ctk.CTkButton(self, text="Save Faction Changes", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#27AE60", height=40)
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
        self.name_input.insert(0, self.data.get("name", ""))
        self.abrev_input.insert(0, self.data.get("abrev", ""))

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "abrev": self.abrev_input.get()
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

    def open_members(self): print("ACTION: Open Members Editor")
    def open_titles(self): print("ACTION: Open Titles Editor")

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = FactionsGUI(path)
    app.mainloop()
