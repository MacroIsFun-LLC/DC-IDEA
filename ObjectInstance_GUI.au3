#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenObjectInstanceGUI($hParent)
    Local $hObjInstGUI = GUICreate("Object Instance Editor", 400, 550, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Sprite/Bitmap area
    GUICtrlCreateLabel("", 150, 20, 100, 100, $SS_SUNKEN)
    
    GUICtrlCreateLabel("Object Type", 150, 130, 100, 20, $SS_CENTER)
    GUICtrlCreateInput("", 70, 155, 260, 24, BitOR($ES_CENTER, $ES_READONLY))
    
    GUICtrlCreateLabel("Health", 20, 200, 50, 20)
    GUICtrlCreateInput("", 80, 198, 80, 22, $ES_NUMBER)
    
    GUICtrlCreateLabel("Map", 200, 200, 40, 20)
    GUICtrlCreateInput("", 240, 198, 140, 22, $ES_READONLY)
    
    ; Properties Placeholder (SS_GRAYRECT equivalent in AutoIt is a themed box or simple label)
    GUICtrlCreateLabel("", 15, 230, 370, 250, $SS_SUNKEN)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 500, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 300, 500, 80, 25)
    
    GUISetState(@SW_SHOW, $hObjInstGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hObjInstGUI)
            Return
        EndIf
    WEnd
EndFunc
