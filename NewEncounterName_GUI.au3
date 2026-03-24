#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenNewEncounterNameGUI($hParent)
    Local $hNewEncGUI = GUICreate("Enter Text", 400, 180, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name of Encounter:", 20, 25, 360, 24, $SS_CENTER)
    Local $txtInput = GUICtrlCreateInput("", 50, 60, 300, 28, $ES_CENTER)
    
    Local $btnOK = GUICtrlCreateButton("OK", 40, 120, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 250, 120, 110, 35)
    
    GUISetState(@SW_SHOW, $hNewEncGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNewEncGUI)
            Return
        EndIf
    WEnd
EndFunc
