#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Func _OpenShopTypeGUI($hParent)
    Local $hShopTypeGUI = GUICreate("Shop Type", 200, 200, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Mapped from New Shop TypeGUI.txt which seems to be a template or placeholder
    GUICtrlCreateLabel("Shop Type Properties", 20, 80, 160, 20)
    
    GUISetState(@SW_SHOW, $hShopTypeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hShopTypeGUI)
            Return
        EndIf
    WEnd
EndFunc
