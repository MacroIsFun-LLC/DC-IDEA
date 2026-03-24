#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectInstanceGUI($hParent)
    Local $hObjInstGUI = GUICreate("Object Instance Editor", 450, 600, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Sprite/Bitmap area
    GUICtrlCreateLabel("", 175, 25, 100, 100, $SS_SUNKEN)
    
    GUICtrlCreateLabel("Object Type", 175, 140, 100, 24, $SS_CENTER)
    GUICtrlCreateInput("", 75, 170, 300, 28, BitOR($ES_CENTER, $ES_READONLY))
    
    GUICtrlCreateLabel("Health:", 25, 230, 60, 24)
    GUICtrlCreateInput("", 90, 227, 100, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Map:", 220, 230, 50, 24)
    GUICtrlCreateInput("", 275, 227, 150, 24, $ES_READONLY)
    
    ; Properties Placeholder
    GUICtrlCreateLabel("Instance Properties Area", 20, 280, 410, 240, BitOR($SS_SUNKEN, $SS_CENTER, $SS_CENTERIMAGE))
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 540, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 315, 540, 110, 35)
    
    GUISetState(@SW_SHOW, $hObjInstGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hObjInstGUI)
            Return
        EndIf
    WEnd
EndFunc
