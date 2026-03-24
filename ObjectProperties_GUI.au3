#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Func _OpenObjectPropertiesGUI($hParent)
    Local $hPropGUI = GUICreate("Object Properties", 350, 180, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Object Properties Placeholder", 20, 50, 310, 40)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 130, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 250, 130, 80, 25)
    
    GUISetState(@SW_SHOW, $hPropGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hPropGUI)
            Return
        EndIf
    WEnd
EndFunc
