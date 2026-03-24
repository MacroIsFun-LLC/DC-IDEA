#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShopInventoryGUI($hParent)
    Local $hShopInvGUI = GUICreate("Shop Inventory Dialog", 400, 480, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Merchant:", 15, 15, 60, 20)
    GUICtrlCreateInput("", 85, 12, 200, 24, $ES_READONLY)
    
    GUICtrlCreateLabel("Standing Inventory:", 15, 50, 120, 20)
    Local $lbInventory = GUICtrlCreateList("", 15, 75, 220, 330, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Quantity:", 250, 105, 60, 20)
    GUICtrlCreateInput("", 315, 102, 60, 24, $ES_NUMBER)
    
    Local $btnAdd = GUICtrlCreateButton("Add", 260, 150, 80, 25)
    Local $btnRemove = GUICtrlCreateButton("Remove", 260, 190, 80, 25)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 435, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 300, 435, 80, 25)
    
    GUISetState(@SW_SHOW, $hShopInvGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hShopInvGUI)
            Return
        EndIf
    WEnd
EndFunc
