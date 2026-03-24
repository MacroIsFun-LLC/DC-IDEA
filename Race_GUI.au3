#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenRaceGUI($hParent)
    Local $hRaceGUI = GUICreate("Race Dialog", 480, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Available Races:", 15, 15, 150, 24)
    Local $lbRaces = GUICtrlCreateList("", 15, 45, 220, 150, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 15, 205, 105, 35)
    Local $btnDelete = GUICtrlCreateButton("Delete", 130, 205, 105, 35)
    
    Local $btnOK = GUICtrlCreateButton("OK", 360, 15, 100, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 360, 65, 100, 35)
    
    ; Attribute Constraints Group
    GUICtrlCreateGroup("Attribute Constraints", 15, 260, 320, 230)
    GUICtrlCreateLabel("min", 130, 290, 60, 24, $SS_CENTER)
    GUICtrlCreateLabel("max", 230, 290, 60, 24, $SS_CENTER)
    
    Local $aLabels = ["Str", "Int", "Dex", "Con"]
    For $i = 0 To 3
        GUICtrlCreateLabel($aLabels[$i] & ":", 45, 325 + ($i * 45), 60, 24)
        GUICtrlCreateInput("", 130, 322 + ($i * 45), 80, 26, BitOR($ES_NUMBER, $ES_CENTER))
        GUICtrlCreateInput("", 230, 322 + ($i * 45), 80, 26, BitOR($ES_NUMBER, $ES_CENTER))
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUISetState(@SW_SHOW, $hRaceGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hRaceGUI)
            Return
        EndIf
    WEnd
EndFunc
