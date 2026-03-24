#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenEncounterTableGUI($hParent)
    Local $hETGUI = GUICreate("Encounter Table", 480, 420, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Table Name:", 25, 25, 100, 24)
    GUICtrlCreateInput("", 130, 23, 300, 24)
    
    GUICtrlCreateLabel("Rate:", 25, 65, 50, 24)
    GUICtrlCreateInput("", 80, 62, 70, 24)
    
    GUICtrlCreateLabel("Chance:", 170, 65, 70, 24)
    GUICtrlCreateInput("", 245, 62, 70, 24)
    
    GUICtrlCreateLabel("Encounter List:", 25, 105, 120, 24)
    Local $lbEncounters = GUICtrlCreateList("", 25, 135, 320, 200, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 360, 135, 90, 35)
    Local $btnDelete = GUICtrlCreateButton("Delete", 360, 185, 90, 35)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 365, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 345, 365, 110, 35)
    
    GUISetState(@SW_SHOW, $hETGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hETGUI)
            Return
        EndIf
    WEnd
EndFunc
