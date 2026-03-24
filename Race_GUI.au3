#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenRaceGUI($hParent)
    Local $hRaceGUI = GUICreate("Race Dialog", 400, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $lbRaces = GUICtrlCreateList("", 15, 15, 180, 130, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 15, 155, 80, 25)
    Local $btnDelete = GUICtrlCreateButton("Delete", 115, 155, 80, 25)
    
    Local $btnOK = GUICtrlCreateButton("OK", 270, 15, 80, 30)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 270, 55, 80, 30)
    
    ; Attribute Constraints Group
    GUICtrlCreateGroup("Attribute Constraints", 15, 200, 250, 220)
    GUICtrlCreateLabel("min", 100, 225, 40, 20)
    GUICtrlCreateLabel("max", 180, 225, 40, 20)
    
    Local $aLabels = ["Str", "Int", "Dex", "Con"]
    For $i = 0 To 3
        GUICtrlCreateLabel($aLabels[$i] & ":", 40, 255 + ($i * 40), 50, 20)
        GUICtrlCreateInput("", 100, 252 + ($i * 40), 60, 24, $ES_NUMBER)
        GUICtrlCreateInput("", 180, 252 + ($i * 40), 60, 24, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUISetState(@SW_SHOW, $hRaceGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hRaceGUI)
            Return
        EndIf
    WEnD
EndFunc
