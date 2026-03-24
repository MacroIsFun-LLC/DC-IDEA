#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenAboutGUI($hParent)
    Local $hAboutGUI = GUICreate("About Dransik Editor", 420, 480, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    GUISetIcon(@ScriptDir & "\Assets\Dransik Editor.ico")
    
    ; Image Area - Viewport trick (Quadrant 1 of 1 2 / 3 4)
    ; Assuming standard 200x200 or similar for the display area
    Local $nViewW = 380
    Local $nViewH = 280
    
    ; Create a child window for the viewport to "crop" the image
    Local $hViewport = GUICreate("", $nViewW, $nViewH, 20, 20, $WS_CHILD, -1, $hAboutGUI)
    ; For Quadrant 1 (Top Left), offset is 0,0
    GUICtrlCreatePic(@ScriptDir & "\Assets\AboutGUI.png", 0, 0) 
    GUISetState(@SW_SHOW, $hViewport)
    
    ; Switch back to main GUI context
    GUISwitch($hAboutGUI)
    
    ; Disclaimer text
    GUICtrlCreateLabel("Copyright (C) 1999 Asylumsoft", 20, 310, 380, 24)
    GUICtrlSetFont(-1, 9, 600)
    
    GUICtrlCreateLabel("This is a Fan Product, It does not contian Any of Dransik Real code.", 20, 345, 380, 50, $SS_CENTER)
    GUICtrlSetFont(-1, 10, 800)
    GUICtrlSetColor(-1, 0x880000) ; Dark red for emphasis
    
    Local $btnOK = GUICtrlCreateButton("OK", 160, 420, 100, 35)
    
    GUISetState(@SW_SHOW, $hAboutGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            ; Clean up child GUI before main
            GUIDelete($hViewport)
            GUIDelete($hAboutGUI)
            Return
        EndIf
    WEnd
EndFunc
