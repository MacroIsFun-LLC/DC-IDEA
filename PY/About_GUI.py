import customtkinter as ctk
import os
import random
from PIL import Image, ImageTk
from base_gui import BaseGUI

class AboutGUI(BaseGUI):
    def __init__(self):
        super().__init__(title="About Dransik Editor", width=750, height=650)
        
        # Dimensions and Assets
        self.pane_w, self.pane_h = 654, 408
        self.img_path = os.path.join(os.path.dirname(__file__), "..", "Assets", "AboutGUI.png")
        
        # Header / Viewport Container
        self.viewport_frame = ctk.CTkFrame(self, width=self.pane_w, height=self.pane_h, corner_radius=10)
        self.viewport_frame.pack(pady=(30, 20))
        
        # Load and Tile Image
        if os.path.exists(self.img_path):
            self.show_random_pane()
        else:
            self.error_label = ctk.CTkLabel(self.viewport_frame, text="IMAGE NOT FOUND", font=self.header_font)
            self.error_label.place(relx=0.5, rely=0.5, anchor="center")
            
        # Disclaimer
        self.disclaimer = ctk.CTkLabel(self, text="This is a Fan Product, It does not contain Any of Dransik Real code.", 
                                       font=ctk.CTkFont(size=14, weight="bold"), text_color="#E74C3C", wraplength=700)
        self.disclaimer.pack(pady=10)
        
        # Copyright
        self.copyright = ctk.CTkLabel(self, text="Copyright (C) 1999 Asylumsoft", font=self.label_font)
        self.copyright.pack(pady=5)
        
        # OK Button
        self.btn_ok = ctk.CTkButton(self, text="OK", command=self.destroy, font=self.button_font, width=120, height=35)
        self.btn_ok.pack(side="bottom", pady=40)

    def show_random_pane(self):
        try:
            full_img = Image.open(self.img_path)
            # Full image size: 1308 x 816
            pane = random.randint(1, 4)
            left, top = 0, 0
            if pane == 2: left = self.pane_w
            elif pane == 3: top = self.pane_h
            elif pane == 4: left, top = self.pane_w, self.pane_h
            
            # Crop image
            cropped = full_img.crop((left, top, left + self.pane_w, top + self.pane_h))
            self.img_tk = ctk.CTkImage(light_image=cropped, dark_image=cropped, size=(self.pane_w, self.pane_h))
            
            self.img_label = ctk.CTkLabel(self.viewport_frame, image=self.img_tk, text="")
            self.img_label.place(x=0, y=0)
        except Exception as e:
            print(f"Error loading image: {e}")

if __name__ == "__main__":
    app = AboutGUI()
    app.mainloop()
