#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectPropertiesGUI($hParent)
    Local $hPropGUI = GUICreate("Object Properties", 400, 200, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Object Properties Area", 25, 50, 350, 50, BitOR($SS_SUNKEN, $SS_CENTER, $SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 10, 600)
    
    Local $btnOK = GUICtrlCreateButton("OK", 40, 140, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 250, 140, 110, 35)
    
    GUISetState(@SW_SHOW, $hPropGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hPropGUI)
            Return
        EndIf
    WEnd
EndFunc
