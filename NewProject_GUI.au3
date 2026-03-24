#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenNewProjectGUI($hParent)
    Local $hNewGUI = GUICreate("New", 400, 200, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("New Project Type:", 15, 15, 200, 20)
    Local $lbTypes = GUICtrlCreateList("", 15, 40, 250, 120, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 300, 15, 80, 30)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 300, 55, 80, 30)
    Local $btnHelp = GUICtrlCreateButton("Help", 300, 130, 80, 25)
    
    GUISetState(@SW_SHOW, $hNewGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNewGUI)
            Return
        EndIf
    WEnd
EndFunc
