#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenNewEncounterNameGUI($hParent)
    Local $hNewEncGUI = GUICreate("Enter Text", 350, 150, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name of Encounter:", 10, 20, 330, 20, $SS_CENTER)
    Local $txtInput = GUICtrlCreateInput("", 50, 50, 250, 24)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 100, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 250, 100, 80, 25)
    
    GUISetState(@SW_SHOW, $hNewEncGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNewEncGUI)
            Return
        EndIf
    WEnd
EndFunc
