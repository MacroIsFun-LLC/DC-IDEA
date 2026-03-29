import customtkinter as ctk
import os
import subprocess
import sys
from base_gui import BaseGUI

class MainEditor(BaseGUI):
    def __init__(self):
        super().__init__(title="Dransik ClassiK Editor - Premium Suite", width=1200, height=700)
        
        # Grid layout (1x2)
        self.grid_columnconfigure(1, weight=1)
        self.grid_rowconfigure(0, weight=1)
        
        # Sidebar Frame
        self.sidebar_frame = ctk.CTkFrame(self, width=200, corner_radius=0)
        self.sidebar_frame.grid(row=0, column=0, sticky="nsew")
        self.sidebar_frame.grid_rowconfigure(10, weight=1)
        
        self.logo_label = ctk.CTkLabel(self.sidebar_frame, text="DC-IDEA", font=ctk.CTkFont(size=24, weight="bold"))
        self.logo_label.grid(row=0, column=0, padx=20, pady=(20, 10))
        
        # Navigation Buttons (Grouped)
        self.add_sidebar_button("NPCEditor", "NPC Editor", 1, self.open_npc_editor)
        self.add_sidebar_button("MapEditor", "Map Editor", 2, self.open_map_editor)
        self.add_sidebar_button("AnimEditor", "Anim Editor", 3, self.open_anim_editor)
        self.add_sidebar_button("ArmorData", "Armor Data", 4, self.open_armor_data)
        self.add_sidebar_button("ShopEditor", "Shop Editor", 5, self.open_shop_editor)
        
        # Separator or Space
        self.appearance_mode_label = ctk.CTkLabel(self.sidebar_frame, text="Appearance Mode:", anchor="w")
        self.appearance_mode_label.grid(row=11, column=0, padx=20, pady=(10, 0))
        self.appearance_mode_optionemenu = ctk.CTkOptionMenu(self.sidebar_frame, values=["Light", "Dark", "System"],
                                                                        command=self.change_appearance_mode_event)
        self.appearance_mode_optionemenu.grid(row=12, column=0, padx=20, pady=(10, 10))
        self.appearance_mode_optionemenu.set("Dark")

        # Main Content Area
        self.main_content = ctk.CTkFrame(self, corner_radius=15, fg_color="transparent")
        self.main_content.grid(row=0, column=1, padx=20, pady=20, sticky="nsew")
        
        # Welcome Hero Section
        self.welcome_label = ctk.CTkLabel(self.main_content, text="Welcome to Dransik ClassiK Editor", font=self.header_font)
        self.welcome_label.pack(pady=(100, 20))
        
        self.desc_label = ctk.CTkLabel(self.main_content, text="Modernized UI powered by Python & CustomTkinter", font=self.label_font)
        self.desc_label.pack(pady=10)
        
        # Status Bar
        self.status_bar = ctk.CTkFrame(self, height=25, corner_radius=0)
        self.status_bar.grid(row=1, column=0, columnspan=2, sticky="ew")
        self.status_label = ctk.CTkLabel(self.status_bar, text="Ready", font=ctk.CTkFont(size=10))
        self.status_label.pack(side="left", padx=10)

        # Standard Menu
        self.setup_menus()

    def add_sidebar_button(self, name, text, row, command):
        btn = ctk.CTkButton(self.sidebar_frame, text=text, command=command, font=self.button_font, anchor="w")
        btn.grid(row=row, column=0, padx=20, pady=10, sticky="ew")

    def setup_menus(self):
        import tkinter as tk
        menubar = tk.Menu(self)
        
        # File Menu
        file_menu = tk.Menu(menubar, tearoff=0)
        file_menu.add_command(label="Open Usecode", command=self.placeholder)
        file_menu.add_command(label="New Usecode", command=self.placeholder)
        file_menu.add_separator()
        file_menu.add_command(label="Exit", command=self.quit)
        menubar.add_cascade(label="File", menu=file_menu)
        
        # Help Menu
        help_menu = tk.Menu(menubar, tearoff=0)
        help_menu.add_command(label="About Dransik Editor...", command=self.open_about)
        menubar.add_cascade(label="Help", menu=help_menu)
        
        self.config(menu=menubar)

    def launch_script(self, script_name):
        script_path = os.path.join(os.path.dirname(__file__), script_name)
        if os.path.exists(script_path):
            self.status_label.configure(text=f"Launching {script_name}...")
            subprocess.Popen([sys.executable, script_path])
        else:
            self.status_label.configure(text=f"Error: {script_name} not found!")

    def change_appearance_mode_event(self, new_appearance_mode: str):
        ctk.set_appearance_mode(new_appearance_mode)

    def open_about(self): self.launch_script("About_GUI.py")
    def open_npc_editor(self): self.launch_script("NPCEditor_GUI.py")
    def open_map_editor(self): self.launch_script("MapEditor_GUI.py")
    def open_anim_editor(self): self.launch_script("AnimEditor_GUI.py")
    def open_armor_data(self): self.launch_script("ArmorData_GUI.py")
    def open_shop_editor(self): self.launch_script("ShopEditor_GUI.py")
    
    def placeholder(self): pass

if __name__ == "__main__":
    try:
        app = MainEditor()
        app.mainloop()
    except Exception as e:
        import tkinter.messagebox as msg
        msg.showerror("Critical Error", f"Application failed to start:\n{str(e)}")
