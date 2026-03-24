#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenTreasuresGUI($hParent)
    Local $hTreasureGUI = GUICreate("Treasure Type Dialog", 720, 600, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Treasure Types:", 25, 25, 120, 24)
    Local $lbTypes = GUICtrlCreateList("", 25, 55, 180, 440, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnAddType = GUICtrlCreateButton("Add Type", 25, 510, 85, 30)
    Local $btnDelType = GUICtrlCreateButton("Del Type", 120, 510, 85, 30)
    
    ; Properties Group
    GUICtrlCreateGroup("Treasure Type Properties", 220, 25, 475, 515)
    
    Local $lbTreasures = GUICtrlCreateList("", 240, 55, 230, 380, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnAddTreasure = GUICtrlCreateButton("Add Treasure", 270, 450, 150, 30)
    Local $btnDelTreasure = GUICtrlCreateButton("Del Treasure", 270, 490, 150, 30)
    
    GUICtrlCreateLabel("There is a", 490, 240, 70, 24)
    GUICtrlCreateInput("", 565, 238, 50, 24)
    GUICtrlCreateLabel("% chance that", 620, 240, 90, 24)
    
    GUICtrlCreateLabel("Quantity:", 490, 285, 70, 24)
    GUICtrlCreateInput("", 565, 282, 50, 24)
    GUICtrlCreateLabel("to", 620, 285, 25, 24)
    GUICtrlCreateInput("", 645, 282, 50, 24)
    
    GUICtrlCreateLabel("will appear in this treasure type.", 490, 330, 180, 45)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 550, 100, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 595, 550, 100, 35)
    
    GUISetState(@SW_SHOW, $hTreasureGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTreasureGUI)
            Return
        EndIf
    WEnd
EndFunc
