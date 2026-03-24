#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShopEditorGUI($hParent)
    Local $hShopGUI = GUICreate("Shop Editor", 620, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Merchant Name:", 25, 25, 120, 24)
    GUICtrlCreateInput("", 150, 23, 300, 24)
    
    GUICtrlCreateLabel("Standing Inventory:", 25, 70, 180, 24)
    Local $lbInventory = GUICtrlCreateList("", 25, 100, 300, 300, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Quantity:", 345, 103, 80, 24)
    GUICtrlCreateInput("1", 430, 100, 80, 24, $ES_NUMBER)
    
    Local $btnAdd = GUICtrlCreateButton("Add Item", 345, 145, 130, 35)
    Local $btnRemove = GUICtrlCreateButton("Remove Item", 345, 195, 130, 35)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 460, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 485, 460, 110, 35)
    
    GUISetState(@SW_SHOW, $hShopGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hShopGUI)
            Return
        EndIf
    WEnd
EndFunc
