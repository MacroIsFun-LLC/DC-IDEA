#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>
#include <EditConstants.au3>

Func _OpenEncounterNameGUI($hParent)
    Local $hEncNameGUI = GUICreate("Encounter Tables", 350, 700, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Encounter Tables:", 20, 20, 150, 24)
    Local $btnNew = GUICtrlCreateButton("New", 260, 15, 70, 30)
    
    Local $lbTables = GUICtrlCreateList("", 20, 55, 310, 520, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Current:", 20, 600, 80, 24)
    GUICtrlCreateInput("", 20, 630, 310, 28, $ES_READONLY)
    
    Local $btnClose = GUICtrlCreateButton("Done", 125, 665, 100, 30)
    
    GUISetState(@SW_SHOW, $hEncNameGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hEncNameGUI)
            Return
        EndIf
    WEnd
EndFunc
