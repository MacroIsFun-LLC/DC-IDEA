#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Func _OpenContainerGUI($hParent)
    Local $hContGUI = GUICreate("Container", 350, 300, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Container View Placeholder", 50, 100, 250, 30, $SS_CENTER)
    GUICtrlSetFont(-1, 12, 600)
    
    Local $btnOK = GUICtrlCreateButton("OK", 125, 230, 100, 35)
    
    GUISetState(@SW_SHOW, $hContGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hContGUI)
            Return
        EndIf
    WEnd
EndFunc
