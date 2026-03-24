#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenNewProjectGUI($hParent)
    Local $hNewGUI = GUICreate("New Project", 450, 260, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("New Project Type:", 25, 25, 200, 24)
    Local $lbTypes = GUICtrlCreateList("", 25, 55, 280, 130, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 340, 25, 90, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 340, 75, 90, 35)
    Local $btnHelp = GUICtrlCreateButton("Help", 340, 155, 90, 32)
    
    Local $btnClose = GUICtrlCreateButton("Done", 175, 210, 100, 35)
    
    GUISetState(@SW_SHOW, $hNewGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Or $nMsg = $btnClose Then
            GUIDelete($hNewGUI)
            Return
        EndIf
    WEnd
EndFunc
