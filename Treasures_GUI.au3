#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenTreasuresGUI($hParent)
    Local $hTreasureGUI = GUICreate("Treasure Type Dialog", 600, 550, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Treasure Types:", 20, 20, 100, 20)
    Local $lbTypes = GUICtrlCreateList("", 20, 45, 150, 420, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnAddType = GUICtrlCreateButton("Add Type", 20, 475, 70, 25)
    Local $btnDelType = GUICtrlCreateButton("Del Type", 100, 475, 70, 25)
    
    ; Properties Group
    GUICtrlCreateGroup("Treasure Type Properties", 190, 20, 390, 480)
    
    Local $lbTreasures = GUICtrlCreateList("", 205, 45, 200, 350, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnAddTreasure = GUICtrlCreateButton("Add Treasure", 230, 405, 120, 25)
    Local $btnDelTreasure = GUICtrlCreateButton("Del Treasure", 230, 440, 120, 25)
    
    GUICtrlCreateLabel("There is a", 420, 240, 60, 20)
    GUICtrlCreateInput("", 485, 238, 40, 22)
    GUICtrlCreateLabel("% chance that", 530, 240, 80, 20)
    
    GUICtrlCreateLabel("Quantity:", 420, 280, 60, 20)
    GUICtrlCreateInput("", 485, 278, 40, 22)
    GUICtrlCreateLabel("to", 530, 280, 20, 20)
    GUICtrlCreateInput("", 550, 278, 40, 22)
    
    GUICtrlCreateLabel("will appear in this treasure type.", 420, 320, 150, 40)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 510, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 500, 510, 80, 25)
    
    GUISetState(@SW_SHOW, $hTreasureGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTreasureGUI)
            Return
        EndIf
    WEnd
EndFunc
