import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class SpriteEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Animation Sprite Editor", width=720, height=550)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Grid layout
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # --- Left: Sprite Selection ---
        self.list_frame = ctk.CTkFrame(self, width=220, corner_radius=0)
        self.list_frame.grid(row=0, column=0, rowspan=2, sticky="nsew")
        ctk.CTkLabel(self.list_frame, text="Sprite Library", font=self.header_font).pack(pady=20, padx=20)
        
        self.sprite_list = ctk.CTkScrollableFrame(self.list_frame, fg_color="#1a1a1a")
        self.sprite_list.pack(fill="both", expand=True, padx=15, pady=(0, 15))
        
        self.btn_new = ctk.CTkButton(self.list_frame, text="Define New Sprite", height=32, fg_color="#27AE60")
        self.btn_new.pack(pady=5, padx=15, fill="x")
        self.btn_del = ctk.CTkButton(self.list_frame, text="Delete Entry", height=32, fg_color="#C0392B")
        self.btn_del.pack(pady=5, padx=15, fill="x")
        
        # --- Right: Editor Canvas ---
        self.editor_frame = ctk.CTkFrame(self, corner_radius=15)
        self.editor_frame.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        ctk.CTkLabel(self.editor_frame, text="Sprite Configuration", font=self.button_font).pack(pady=10)
        
        # Name Row
        self.name_row = ctk.CTkFrame(self.editor_frame, fg_color="transparent")
        self.name_row.pack(fill="x", padx=20, pady=10)
        ctk.CTkLabel(self.name_row, text="Name:", font=self.label_font).pack(side="left")
        self.name_input = ctk.CTkEntry(self.name_row, width=250)
        self.name_input.pack(side="left", padx=10)
        
        # Frame Grid (8 Frames)
        ctk.CTkLabel(self.editor_frame, text="Animation Sequence (8-Frame Sequence):", font=self.label_font).pack(pady=(20, 5), padx=20, anchor="w")
        
        self.grid_frame = ctk.CTkFrame(self.editor_frame, fg_color="#111111", corner_radius=10)
        self.grid_frame.pack(fill="x", padx=20, pady=10)
        
        self.frames = []
        for i in range(2): # 2 rows of 4
            row_frame = ctk.CTkFrame(self.grid_frame, fg_color="transparent")
            row_frame.pack(fill="x", pady=5)
            for j in range(4):
                idx = i * 4 + j
                f_box = ctk.CTkFrame(row_frame, width=72, height=72, fg_color="#222222", border_width=1, border_color="#333333")
                f_box.pack(side="left", padx=10, pady=5)
                f_box.pack_propagate(False)
                lbl = ctk.CTkLabel(f_box, text=f"F{idx+1}", font=ctk.CTkFont(size=10))
                lbl.place(relx=0.5, rely=0.5, anchor="center")
                self.frames.append(f_box)
        
        # Footer
        self.footer = ctk.CTkFrame(self, fg_color="transparent")
        self.footer.grid(row=1, column=1, pady=10, padx=20, sticky="ew")
        
        self.btn_close = ctk.CTkButton(self.footer, text="Save & Close Editor", command=self.save_and_exit, 
                                       font=self.button_font, fg_color="#2980B9", height=40)
        self.btn_close.pack(fill="x")

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
        # Logic to handle frame previews would go here

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "frames": 8 # Placeholder
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = SpriteEditorGUI(path)
    app.mainloop()
