import customtkinter as ctk
import os
import sys

class BaseGUI(ctk.CTk):
    def __init__(self, title="Dransik ClassiK Editor", width=400, height=300):
        super().__init__()
        
        # Appearance configuration
        ctk.set_appearance_mode("Dark")
        ctk.set_default_color_theme("blue")
        
        # Standardized Fonts
        self.header_font = ctk.CTkFont(family="Inter", size=18, weight="bold")
        self.label_font = ctk.CTkFont(family="Inter", size=12)
        self.button_font = ctk.CTkFont(family="Inter", size=12, weight="bold")
        
        # Window setup
        self.title(title)
        self.geometry(f"{width}x{height}")
        self.center_window(width, height)
        
        # Icon handling (placeholder logic)
        self.icon_path = os.path.join(os.path.dirname(__file__), "..", "Assets", "Dransik Editor.ico")
        if os.path.exists(self.icon_path):
            try:
                self.iconbitmap(self.icon_path)
            except Exception:
                pass # Fallback for some OS/Environments

    def center_window(self, width, height):
        try:
            self.update_idletasks()
            screen_width = self.winfo_screenwidth()
            screen_height = self.winfo_screenheight()
            x = (screen_width // 2) - (width // 2)
            y = (screen_height // 2) - (height // 2)
            self.geometry(f"{width}x{height}+{x}+{y}")
        except Exception:
            self.geometry(f"{width}x{height}+100+100") # Safe fallback

if __name__ == "__main__":
    # Test instance
    app = BaseGUI("Base Styling Test", 500, 400)
    label = ctk.CTkLabel(app, text="Dransik Base Styling System", font=app.header_font)
    label.pack(pady=20)
    btn = ctk.CTkButton(app, text="Test Button", font=app.button_font)
    btn.pack(pady=10)
    app.mainloop()
