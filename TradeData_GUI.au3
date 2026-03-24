#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>
#include <ComboConstants.au3>

Func _OpenTradeDataGUI($hParent)
    Local $hTradeGUI = GUICreate("Trade Object Editor", 700, 500, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Types:", 20, 20, 50, 20)
    GUICtrlCreateCombo("", 20, 45, 180, 20, $CBS_DROPDOWNLIST)
    Local $lbTypes = GUICtrlCreateList("", 20, 80, 180, 350, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnRight = GUICtrlCreateButton(">>", 215, 100, 30, 30)
    Local $btnLeft = GUICtrlCreateButton("<<", 215, 140, 30, 30)
    
    GUICtrlCreateLabel("Trade Objects:", 260, 20, 100, 20)
    GUICtrlCreateCombo("", 260, 45, 180, 20, $CBS_DROPDOWNLIST)
    Local $lbObjects = GUICtrlCreateList("", 260, 80, 180, 350, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    ; Trade Object Information Group
    GUICtrlCreateGroup("Trade Object Information", 460, 120, 220, 250)
    
    GUICtrlCreateLabel("Source Material:", 475, 145, 100, 20)
    GUICtrlCreateCombo("", 475, 165, 190, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Quantity:", 475, 205, 60, 20)
    GUICtrlCreateInput("1", 540, 202, 60, 22, $ES_NUMBER)
    
    GUICtrlCreateLabel("Min Skill Req:", 475, 235, 100, 20)
    GUICtrlCreateInput("0", 580, 232, 60, 22, $ES_NUMBER)
    
    GUICtrlCreateLabel("Difficulty:", 475, 265, 60, 20)
    GUICtrlCreateInput("0", 540, 262, 60, 22, $ES_NUMBER)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 460, 440, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 600, 440, 80, 25)
    
    GUISetState(@SW_SHOW, $hTradeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTradeGUI)
            Return
        EndIf
    WEnd
EndFunc
