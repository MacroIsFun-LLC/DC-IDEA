#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenNewMapGUI($hParent)
    Local $hNewMapGUI = GUICreate("New Map", 350, 240, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 40, 30, 60, 24)
    GUICtrlCreateInput("", 110, 27, 200, 24)
    
    GUICtrlCreateLabel("X:", 70, 75, 30, 24)
    GUICtrlCreateInput("", 110, 72, 80, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Y:", 70, 120, 30, 24)
    GUICtrlCreateInput("", 110, 117, 80, 24, $ES_NUMBER)
    
    Local $btnCreate = GUICtrlCreateButton("Create", 30, 180, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 210, 180, 110, 35)
    
    GUISetState(@SW_SHOW, $hNewMapGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnCreate Then
            GUIDelete($hNewMapGUI)
            Return
        EndIf
    WEnd
EndFunc
