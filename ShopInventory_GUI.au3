#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShopInventoryGUI($hParent)
    Local $hShopInvGUI = GUICreate("Shop Inventory Dialog", 480, 550, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Merchant:", 25, 25, 80, 24)
    GUICtrlCreateInput("", 115, 22, 250, 28, $ES_READONLY)
    
    GUICtrlCreateLabel("Standing Inventory:", 25, 70, 150, 24)
    Local $lbInventory = GUICtrlCreateList("", 25, 100, 280, 350, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Quantity:", 330, 133, 80, 24)
    GUICtrlCreateInput("", 415, 130, 50, 24, $ES_NUMBER)
    
    Local $btnAdd = GUICtrlCreateButton("Add", 330, 180, 100, 35)
    Local $btnRemove = GUICtrlCreateButton("Remove", 330, 230, 100, 35)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 490, 120, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 335, 490, 120, 35)
    
    GUISetState(@SW_SHOW, $hShopInvGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hShopInvGUI)
            Return
        EndIf
    WEnd
EndFunc
