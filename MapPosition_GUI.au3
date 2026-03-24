#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenMapPositionGUI($hParent)
    Local $hPosGUI = GUICreate("Position", 300, 180, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("XPOS:", 50, 40, 60, 24)
    GUICtrlCreateInput("", 120, 37, 100, 24, $ES_READONLY)
    
    GUICtrlCreateLabel("YPOS:", 50, 80, 60, 24)
    GUICtrlCreateInput("", 120, 77, 100, 24, $ES_READONLY)
    
    Local $btnOK = GUICtrlCreateButton("OK", 100, 130, 100, 32)
    
    GUISetState(@SW_SHOW, $hPosGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hPosGUI)
            Return
        EndIf
    WEnd
EndFunc
