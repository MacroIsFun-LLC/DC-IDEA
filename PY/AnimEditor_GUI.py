import customtkinter as ctk
import os
import sys
import json
from base_gui import BaseGUI

class AnimEditorGUI(BaseGUI):
    def __init__(self, data_path=None):
        super().__init__(title="Sequence Animation Editor", width=480, height=380)
        self.data_path = data_path
        self.data = self.load_data()
        
        # Main Layout
        self.main_frame = ctk.CTkFrame(self, corner_radius=15)
        self.main_frame.pack(padx=20, pady=20, fill="both", expand=True)
        
        # Header: Name
        self.name_row = ctk.CTkFrame(self.main_frame, fg_color="transparent")
        self.name_row.pack(fill="x", padx=15, pady=(15, 5))
        ctk.CTkLabel(self.name_row, text="Sequence Name:", font=self.label_font).pack(side="left")
        self.name_input = ctk.CTkEntry(self.name_row, width=220)
        self.name_input.pack(side="left", padx=10)
        
        # Preview Sequence (8 Boxes)
        self.seq_frame = ctk.CTkFrame(self.main_frame, fg_color="#111111", corner_radius=8)
        self.seq_frame.pack(fill="x", padx=15, pady=10)
        
        self.frames = []
        for i in range(8):
            f = ctk.CTkFrame(self.seq_frame, width=42, height=42, fg_color="#222222", border_width=1, border_color="#333333")
            f.pack(side="left", padx=5, pady=10)
            f.pack_propagate(False)
            lbl = ctk.CTkLabel(f, text=str(i+1), font=ctk.CTkFont(size=9))
            lbl.place(relx=0.5, rely=0.5, anchor="center")
            self.frames.append(f)
            
        # Controls Group
        self.ctrl_frame = ctk.CTkFrame(self.main_frame)
        self.ctrl_frame.pack(fill="both", expand=True, padx=15, pady=10)
        ctk.CTkLabel(self.ctrl_frame, text="Playback Engine Settings", font=self.button_font).pack(pady=5)
        
        grid = ctk.CTkFrame(self.ctrl_frame, fg_color="transparent")
        grid.pack(padx=20, pady=5, fill="x")
        
        ctk.CTkLabel(grid, text="Tick Speed:", font=self.label_font).grid(row=0, column=0, pady=5, sticky="w")
        self.speed_input = ctk.CTkEntry(grid, width=70)
        self.speed_input.grid(row=0, column=1, padx=10, sticky="w")
        
        self.check_random = ctk.CTkCheckBox(grid, text="Random Jitter", font=self.label_font)
        self.check_random.grid(row=0, column=2, padx=20, sticky="w")
        
        ctk.CTkLabel(grid, text="Loop Frames:", font=self.label_font).grid(row=1, column=0, pady=5, sticky="w")
        self.frame_count = ctk.CTkEntry(grid, width=70)
        self.frame_count.grid(row=1, column=1, padx=10, sticky="w")
        
        ctk.CTkLabel(grid, text="Loop Type:", font=self.label_font).grid(row=1, column=2, pady=5, sticky="w")
        self.type_combo = ctk.CTkComboBox(grid, values=["Linear", "Ping-Pong", "Random", "Once"], width=100)
        self.type_combo.grid(row=1, column=3, padx=10, sticky="w")
        
        # Footer
        self.btn_done = ctk.CTkButton(self.main_frame, text="Commit Sequence", command=self.save_and_exit, 
                                      font=self.button_font, fg_color="#2980B9", height=32)
        self.btn_done.pack(side="bottom", fill="x", padx=15, pady=15)

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
        self.speed_input.insert(0, str(self.data.get("speed", "100")))
        self.frame_count.insert(0, str(self.data.get("frames", "8")))
        self.type_combo.set(self.data.get("type", "Linear"))
        if self.data.get("random"): self.check_random.select()

    def save_and_exit(self):
        output = {
            "name": self.name_input.get(),
            "speed": self.speed_input.get(),
            "frames": self.frame_count.get(),
            "type": self.type_combo.get(),
            "random": self.check_random.get()
        }
        if self.data_path:
            with open(self.data_path, 'w') as f:
                json.dump(output, f, indent=4)
        print("SUCCESS")
        self.destroy()

if __name__ == "__main__":
    path = sys.argv[1] if len(sys.argv) > 1 else None
    app = AnimEditorGUI(path)
    app.mainloop()
