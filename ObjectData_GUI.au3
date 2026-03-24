#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectDataGUI($hParent)
    Local $hObjDataGUI = GUICreate("Object Data", 400, 220, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Sprite/Bitmap
    GUICtrlCreateLabel("", 40, 15, 60, 60, BitOR($SS_SUNKEN, $SS_CENTERIMAGE))
    
    GUICtrlCreateLabel("Id:", 60, 95, 20, 20)
    GUICtrlCreateInput("", 85, 92, 60, 22, BitOR($ES_READONLY, $WS_BORDER))
    
    GUICtrlCreateLabel("Health:", 20, 130, 50, 20)
    GUICtrlCreateInput("", 75, 128, 70, 22, $WS_BORDER)
    
    GUICtrlCreateLabel("Quality:", 20, 160, 50, 20)
    GUICtrlCreateInput("", 75, 158, 70, 22, $WS_BORDER)
    
    ; Flags Group
    GUICtrlCreateGroup("Flags", 170, 15, 200, 170)
    GUICtrlCreateCheckbox("Object is secure", 185, 45, 150, 20)
    GUICtrlCreateCheckbox("Object is blessed", 185, 75, 150, 20)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUISetState(@SW_SHOW, $hObjDataGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hObjDataGUI)
            Return
        EndIf
    WEnd
EndFunc
