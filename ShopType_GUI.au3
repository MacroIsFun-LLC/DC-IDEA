#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenShopTypeGUI($hParent)
    Local $hShopTypeGUI = GUICreate("Shop Type", 350, 250, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Shop Type Properties", 25, 80, 300, 30, $SS_CENTER)
    GUICtrlSetFont(-1, 10, 600)
    
    Local $btnDone = GUICtrlCreateButton("Done", 125, 180, 100, 35)
    
    GUISetState(@SW_SHOW, $hShopTypeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hShopTypeGUI)
            Return
        EndIf
    WEnd
EndFunc
