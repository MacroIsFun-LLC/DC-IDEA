#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenGenericInputGUI($hParent)
    Local $hInputGUI = GUICreate("Input", 400, 120, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 40, 90, 35)
    Local $txtInput = GUICtrlCreateInput("", 130, 45, 140, 28, $ES_CENTER)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 290, 40, 90, 35)
    
    GUISetState(@SW_SHOW, $hInputGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hInputGUI)
            Return
        EndIf
    WEnd
EndFunc
