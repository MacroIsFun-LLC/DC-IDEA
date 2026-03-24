#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenEncounterTableGUI($hParent)
    Local $hETGUI = GUICreate("Encounter Table", 400, 350, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Table Name:", 20, 20, 80, 20)
    GUICtrlCreateInput("", 100, 18, 250, 22)
    
    GUICtrlCreateLabel("Rate:", 20, 50, 40, 20)
    GUICtrlCreateInput("", 65, 48, 50, 22)
    
    GUICtrlCreateLabel("Chance:", 150, 50, 50, 20)
    GUICtrlCreateInput("", 205, 48, 50, 22)
    
    GUICtrlCreateLabel("Encounter List:", 20, 85, 100, 20)
    Local $lbEncounters = GUICtrlCreateList("", 20, 110, 280, 150, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 310, 110, 70, 25)
    Local $btnDelete = GUICtrlCreateButton("Delete", 310, 145, 70, 25)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 300, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 300, 300, 80, 25)
    
    GUISetState(@SW_SHOW, $hETGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hETGUI)
            Return
        EndIf
    WEnd
EndFunc
