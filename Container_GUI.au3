#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Func _OpenContainerGUI($hParent)
    Local $hContGUI = GUICreate("Container", 200, 200, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Container defined as an empty dialog in resource script, likely meant as a placeholder or generic window
    GUICtrlCreateLabel("Container View Placeholder", 20, 80, 160, 20)
    
    GUISetState(@SW_SHOW, $hContGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hContGUI)
            Return
        EndIf
    WEnd
EndFunc
