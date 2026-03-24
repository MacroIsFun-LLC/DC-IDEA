#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenSelectMapGUI($hParent)
    Local $hSelectMapGUI = GUICreate("Select A Map", 450, 420, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Please Select a Map to Open", 40, 15, 370, 25, BitOR($SS_CENTER, $SS_CENTERIMAGE, $SS_SUNKEN))
    
    Local $lbMaps = GUICtrlCreateList("", 40, 50, 370, 300, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 15, 380, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 355, 380, 80, 25)
    
    GUISetState(@SW_SHOW, $hSelectMapGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Then
            GUIDelete($hSelectMapGUI)
            Return
        EndIf
    WEnd
EndFunc
