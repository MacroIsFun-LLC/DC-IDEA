#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenMapPositionGUI($hParent)
    Local $hPosGUI = GUICreate("Position", 250, 150, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("XPOS:", 40, 30, 60, 20)
    GUICtrlCreateInput("", 105, 28, 80, 22, $ES_READONLY)
    
    GUICtrlCreateLabel("YPOS:", 40, 65, 60, 20)
    GUICtrlCreateInput("", 105, 63, 80, 22, $ES_READONLY)
    
    Local $btnOK = GUICtrlCreateButton("OK", 85, 105, 80, 25)
    
    GUISetState(@SW_SHOW, $hPosGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hPosGUI)
            Return
        EndIf
    WEnd
EndFunc
