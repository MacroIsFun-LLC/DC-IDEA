#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectEditorGUI($hParent)
    Local $hObjEditGUI = GUICreate("Object Editor", 400, 320, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    GUISetIcon(@ScriptDir & "\Assets\Dransik Editor.ico")
    
    ; Image Placeholder
    GUICtrlCreateLabel("", 15, 15, 370, 200, $SS_SUNKEN)
    
    GUICtrlCreateLabel("Copyright (C) 1999 Asylumsoft", 15, 240, 250, 24)
    
    Local $btnOK = GUICtrlCreateButton("OK", 310, 275, 80, 32)
    
    GUISetState(@SW_SHOW, $hObjEditGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hObjEditGUI)
            Return
        EndIf
    WEnd
EndFunc
