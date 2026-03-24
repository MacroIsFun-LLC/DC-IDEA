#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenNPCEditorGUI($hParent)
    Local $hNPCGUI = GUICreate("Npc Editor", 600, 540, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 25, 20, 60, 24)
    GUICtrlCreateInput("", 95, 18, 280, 24)
    
    ; Attributes Group
    GUICtrlCreateGroup("Attributes", 25, 65, 260, 340)
    Local $aAttribs = ["Strength", "Intelligence", "Dexterity", "Constitution", "Health", "Max Health", "Level", "Mana", "Armorclass"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 40, 105 + ($i * 32), 110, 24)
        GUICtrlCreateInput("", 160, 102 + ($i * 32), 100, 24, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Alignment Group
    GUICtrlCreateGroup("Alignment", 310, 65, 265, 110)
    Local $btnGood = GUICtrlCreateButton("Good", 325, 105, 75, 35)
    Local $btnNeutral = GUICtrlCreateButton("Neutral", 405, 105, 75, 35)
    Local $btnEvil = GUICtrlCreateButton("Evil", 485, 105, 75, 35)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Activity:", 310, 195, 90, 24)
    GUICtrlCreateCombo("", 410, 193, 160, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Shop Type:", 310, 240, 95, 24)
    GUICtrlCreateCombo("", 410, 238, 100, 22, $CBS_DROPDOWNLIST)
    Local $btnInventory = GUICtrlCreateButton("Inventory", 515, 238, 65, 26)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 475, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 465, 475, 110, 35)
    
    GUISetState(@SW_SHOW, $hNPCGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNPCGUI)
            Return
        EndIf
    WEnd
EndFunc
