import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class ContainerGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Dransik Storage Container", width=500, height=520)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.grid_columnconfigure(0, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Container Outer
        self.outer_frame = ctk.CTkFrame(self, corner_radius=15)
        self.outer_frame.grid(row=0, column=0, padx=20, pady=20, sticky="nsew")
        
        # Grid Title
        ctk.CTkLabel(self.outer_frame, text="Storage Repository (8x8)", font=self.header_font).pack(pady=10)
        
        # Item Grid
        self.grid_frame = ctk.CTkFrame(self.outer_frame, fg_color="#111111", corner_radius=10)
        self.grid_frame.pack(padx=20, pady=10, fill="both", expand=True)
        
        self.slots = []
        for r in range(8):
            row_frame = ctk.CTkFrame(self.grid_frame, fg_color="transparent")
            row_frame.pack(fill="x", pady=2, padx=10)
            for c in range(8):
                slot = ctk.CTkFrame(row_frame, width=42, height=42, fg_color="#222222", border_width=1, border_color="#333333")
                slot.pack(side="left", padx=2)
                slot.pack_propagate(False)
                lbl = ctk.CTkLabel(slot, text="", font=ctk.CTkFont(size=9))
                lbl.place(relx=0.5, rely=0.5, anchor="center")
                self.slots.append(slot)
                
        # Footer Actions
        self.footer = ctk.CTkFrame(self.outer_frame, fg_color="transparent")
        self.footer.pack(fill="x", side="bottom", pady=20, padx=20)
        
        self.btn_done = ctk.CTkButton(self.footer, text="Seal Container", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_done.pack(fill="x")

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
        # Logic to populate items in slots would go here
        pass

    def save_and_exit(self):
        output = {"status": "success", "content_hash": "A3F2"}
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = ContainerGUI(path)
    app.mainloop()
