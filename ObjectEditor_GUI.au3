#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectEditorGUI($hParent)
    Local $hObjEditGUI = GUICreate("Object Editor", 350, 280, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Mapped from Object EditorGUI.txt which is identical to About Dialog in the legacy resources
    GUICtrlCreateLabel("Copyright (C) 1999 Asylumsoft", 15, 220, 200, 20)
    GUICtrlCreateLabel("", 15, 15, 320, 190, $SS_SUNKEN)
    
    Local $btnOK = GUICtrlCreateButton("OK", 270, 240, 70, 25)
    
    GUISetState(@SW_SHOW, $hObjEditGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hObjEditGUI)
            Return
        EndIf
    WEnd
EndFunc
