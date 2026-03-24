#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>
#include <EditConstants.au3>

Func _OpenEncounterNameGUI($hParent)
    Local $hEncNameGUI = GUICreate("Encounter Tables", 250, 650, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Encounter Tables:", 15, 15, 100, 20)
    Local $btnNew = GUICtrlCreateButton("New", 185, 12, 50, 24)
    
    Local $lbTables = GUICtrlCreateList("", 15, 45, 220, 520, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Current:", 15, 580, 60, 20)
    GUICtrlCreateInput("", 15, 605, 220, 25, $ES_READONLY)
    
    GUISetState(@SW_SHOW, $hEncNameGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hEncNameGUI)
            Return
        EndIf
    WEnd
EndFunc
