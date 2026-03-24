#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectDataGUI($hParent)
    Local $hObjDataGUI = GUICreate("Object Data", 450, 280, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Sprite/Bitmap
    GUICtrlCreateLabel("", 40, 20, 80, 80, BitOR($SS_SUNKEN, $SS_CENTERIMAGE))
    
    GUICtrlCreateLabel("Id:", 40, 115, 40, 24)
    GUICtrlCreateInput("", 90, 112, 80, 24, BitOR($ES_READONLY, $WS_BORDER))
    
    GUICtrlCreateLabel("Health:", 25, 160, 60, 24)
    GUICtrlCreateInput("", 90, 158, 80, 24, $WS_BORDER)
    
    GUICtrlCreateLabel("Quality:", 25, 200, 60, 24)
    GUICtrlCreateInput("", 90, 198, 80, 24, $WS_BORDER)
    
    ; Flags Group
    GUICtrlCreateGroup("Flags", 190, 20, 240, 200)
    GUICtrlCreateCheckbox("Object is secure", 205, 55, 180, 24)
    GUICtrlCreateCheckbox("Object is blessed", 205, 95, 180, 24)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnDone = GUICtrlCreateButton("Done", 175, 235, 100, 35)
    
    GUISetState(@SW_SHOW, $hObjDataGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hObjDataGUI)
            Return
        EndIf
    WEnd
EndFunc
