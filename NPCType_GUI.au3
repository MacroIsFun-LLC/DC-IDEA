#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenNPCTypeGUI($hParent)
    Local $hTypeGUI = GUICreate("New Map", 300, 180, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 30, 25, 50, 20)
    GUICtrlCreateInput("", 90, 22, 180, 24)
    
    GUICtrlCreateLabel("X:", 60, 65, 20, 20)
    GUICtrlCreateInput("", 90, 62, 60, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Y:", 60, 105, 20, 20)
    GUICtrlCreateInput("", 90, 102, 60, 24, $ES_NUMBER)
    
    Local $btnCreate = GUICtrlCreateButton("Create", 20, 140, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 200, 140, 80, 25)
    
    GUISetState(@SW_SHOW, $hTypeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnCreate Then
            GUIDelete($hTypeGUI)
            Return
        EndIf
    WEnd
EndFunc
