#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenSelectMapGUI($hParent)
    Local $hSelectMapGUI = GUICreate("Select A Map", 550, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Please Select a Map to Open", 40, 20, 470, 30, BitOR($SS_CENTER, $SS_CENTERIMAGE, $SS_SUNKEN))
    GUICtrlSetFont(-1, 10, 600)
    
    Local $lbMaps = GUICtrlCreateList("", 40, 70, 470, 360, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 25, 460, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 415, 460, 110, 35)
    
    GUISetState(@SW_SHOW, $hSelectMapGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Then
            GUIDelete($hSelectMapGUI)
            Return
        EndIf
    WEnd
EndFunc
