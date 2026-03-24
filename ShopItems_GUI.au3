#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShopItemsGUI($hParent)
    Local $hShopItemsGUI = GUICreate("Shop Items", 350, 650, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $lbItems = GUICtrlCreateList("", 25, 25, 300, 500, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 590, 120, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 205, 590, 120, 35)
    
    GUISetState(@SW_SHOW, $hShopItemsGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hShopItemsGUI)
            Return
        EndIf
    WEnd
EndFunc
