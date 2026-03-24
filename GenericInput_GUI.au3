#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenGenericInputGUI($hParent)
    Local $hInputGUI = GUICreate("Input", 250, 60, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $btnOK = GUICtrlCreateButton("OK", 10, 15, 60, 24)
    Local $txtInput = GUICtrlCreateInput("", 85, 15, 80, 24)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 180, 15, 60, 24)
    
    GUISetState(@SW_SHOW, $hInputGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hInputGUI)
            Return
        EndIf
    WEnd
EndFunc
