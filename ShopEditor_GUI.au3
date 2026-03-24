#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShopEditorGUI($hParent)
    Local $hShopGUI = GUICreate("Shop Editor", 550, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Merchant Name:", 20, 20, 100, 20)
    GUICtrlCreateInput("", 125, 18, 250, 22)
    
    GUICtrlCreateLabel("Standing Inventory:", 20, 50, 150, 20)
    Local $lbInventory = GUICtrlCreateList("", 20, 75, 250, 250, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    GUICtrlCreateLabel("Quantity:", 285, 78, 60, 20)
    GUICtrlCreateInput("1", 350, 75, 60, 22, $ES_NUMBER)
    
    Local $btnAdd = GUICtrlCreateButton("Add Item", 285, 110, 100, 25)
    Local $btnRemove = GUICtrlCreateButton("Remove Item", 285, 145, 100, 25)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 400, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 450, 400, 80, 25)
    
    GUISetState(@SW_SHOW, $hShopGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hShopGUI)
            Return
        EndIf
    WEnd
EndFunc
