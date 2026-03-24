#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>
#include <ComboConstants.au3>

Func _OpenTradeDataGUI($hParent)
    Local $hTradeGUI = GUICreate("Trade Object Editor", 800, 550, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Types:", 25, 25, 60, 24)
    GUICtrlCreateCombo("", 25, 50, 200, 22, $CBS_DROPDOWNLIST)
    Local $lbTypes = GUICtrlCreateList("", 25, 85, 200, 380, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnRight = GUICtrlCreateButton(">>", 240, 120, 40, 40)
    Local $btnLeft = GUICtrlCreateButton("<<", 240, 170, 40, 40)
    
    GUICtrlCreateLabel("Trade Objects:", 300, 25, 120, 24)
    GUICtrlCreateCombo("", 300, 50, 200, 22, $CBS_DROPDOWNLIST)
    Local $lbObjects = GUICtrlCreateList("", 300, 85, 200, 380, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    ; Trade Object Information Group
    GUICtrlCreateGroup("Trade Object Information", 525, 120, 250, 280)
    
    GUICtrlCreateLabel("Source Material:", 540, 150, 120, 24)
    GUICtrlCreateCombo("", 540, 175, 220, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Quantity:", 540, 220, 70, 24)
    GUICtrlCreateInput("1", 620, 218, 70, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Min Skill Req:", 540, 260, 110, 24)
    GUICtrlCreateInput("0", 660, 258, 70, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Difficulty:", 540, 300, 70, 24)
    GUICtrlCreateInput("0", 620, 298, 70, 24, $ES_NUMBER)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 525, 480, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 665, 480, 110, 35)
    
    GUISetState(@SW_SHOW, $hTradeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTradeGUI)
            Return
        EndIf
    WEnd
EndFunc
