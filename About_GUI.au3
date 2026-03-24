#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenAboutGUI($hParent)
    Local $hAboutGUI = GUICreate("About Dransik Editor", 350, 280, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    GUISetIcon(@ScriptDir & "\Assets\Dransik Editor.ico")
    
    ; Image Placeholder (SS_BITMAP equivalent)
    GUICtrlCreateLabel("", 10, 10, 330, 200, $SS_SUNKEN)
    ; In a real app we'd load a bitmap here
    
    GUICtrlCreateLabel("Copyright (C) 1999 Asylumsoft", 10, 220, 200, 20)
    
    Local $btnOK = GUICtrlCreateButton("OK", 270, 240, 70, 25)
    
    GUISetState(@SW_SHOW, $hAboutGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hAboutGUI)
            Return
        EndIf
    WEnd
EndFunc
