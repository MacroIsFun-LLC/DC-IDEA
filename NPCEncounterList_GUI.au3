#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenNPCEncounterListGUI($hParent)
    Local $hListGUI = GUICreate("Npc Encounter List", 250, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Choose an NPC from this list:", 20, 15, 210, 20)
    Local $lbNPCs = GUICtrlCreateList("", 15, 40, 220, 350, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 405, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 150, 405, 80, 25)
    
    GUISetState(@SW_SHOW, $hListGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hListGUI)
            Return
        EndIf
    WEnd
EndFunc
