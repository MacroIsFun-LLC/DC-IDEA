#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenNPCEditorGUI($hParent)
    Local $hNPCGUI = GUICreate("Npc Editor", 500, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 20, 20, 50, 20)
    GUICtrlCreateInput("", 75, 18, 250, 22)
    
    ; Attributes Group
    GUICtrlCreateGroup("Attributes", 20, 60, 200, 200)
    Local $aAttribs = ["Strength", "Intelligence", "Dexterity", "Constitution", "Health", "Max Health", "Level", "Mana", "Armorclass"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 35, 85 + ($i * 25), 80, 20)
        GUICtrlCreateInput("", 120, 82 + ($i * 25), 80, 20, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Alignment Group
    GUICtrlCreateGroup("Alignment", 240, 60, 240, 80)
    Local $btnGood = GUICtrlCreateButton("Good", 255, 85, 60, 25)
    Local $btnNeutral = GUICtrlCreateButton("Neutral", 325, 85, 60, 25)
    Local $btnEvil = GUICtrlCreateButton("Evil", 395, 85, 60, 25)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Activity:", 240, 160, 60, 20)
    GUICtrlCreateCombo("", 310, 158, 150, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Shop Type:", 240, 195, 70, 20)
    GUICtrlCreateCombo("", 310, 193, 100, 20, $CBS_DROPDOWNLIST)
    Local $btnInventory = GUICtrlCreateButton("Inventory", 415, 193, 65, 23)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 400, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 400, 400, 80, 25)
    
    GUISetState(@SW_SHOW, $hNPCGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNPCGUI)
            Return
        EndIf
    WEnd
EndFunc
