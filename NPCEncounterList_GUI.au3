#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenNPCEncounterListGUI($hParent)
    Local $hListGUI = GUICreate("Npc Encounter List", 350, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Choose an NPC from this list:", 25, 20, 300, 24)
    Local $lbNPCs = GUICtrlCreateList("", 25, 50, 300, 400, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 465, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 215, 465, 110, 35)
    
    GUISetState(@SW_SHOW, $hListGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hListGUI)
            Return
        EndIf
    WEnd
EndFunc
