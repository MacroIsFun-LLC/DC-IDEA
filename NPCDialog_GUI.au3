#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenNPCDialogGUI($hParent)
    Local $hNPCDlgGUI = GUICreate("Npc Dialog", 550, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 30, 25, 60, 24)
    GUICtrlCreateInput("", 100, 23, 300, 24)
    
    ; Attributes Group
    GUICtrlCreateGroup("Attributes", 25, 75, 230, 220)
    Local $aAttribsL = ["Strength", "Intelligence", "Dexterity", "Constitution"]
    For $i = 0 To UBound($aAttribsL) - 1
        GUICtrlCreateLabel($aAttribsL[$i] & ":", 40, 105 + ($i * 35), 100, 24)
        GUICtrlCreateInput("", 150, 102 + ($i * 35), 80, 24, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Right Side Attributes
    GUICtrlCreateLabel("Health:", 280, 105, 80, 24)
    GUICtrlCreateInput("", 380, 102, 80, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Max Health:", 280, 140, 90, 24)
    GUICtrlCreateInput("", 380, 137, 80, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Level:", 280, 175, 70, 24)
    GUICtrlCreateInput("", 380, 172, 80, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Mana:", 280, 210, 60, 24)
    GUICtrlCreateInput("", 380, 207, 80, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Armorclass:", 280, 245, 90, 24)
    GUICtrlCreateInput("", 380, 242, 80, 24, $ES_NUMBER)
    
    ; Alignment Group
    GUICtrlCreateGroup("Alignment", 25, 305, 500, 75)
    GUICtrlCreateInput("", 45, 335, 70, 28, $ES_NUMBER)
    Local $btnGood = GUICtrlCreateButton("Good", 130, 330, 85, 35)
    Local $btnNeutral = GUICtrlCreateButton("Neutral", 230, 330, 85, 35)
    Local $btnEvil = GUICtrlCreateButton("Evil", 330, 330, 85, 35)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Activity:", 25, 400, 80, 24)
    GUICtrlCreateCombo("", 115, 398, 180, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Shop Type:", 25, 440, 90, 24)
    GUICtrlCreateCombo("", 115, 438, 120, 22, $CBS_DROPDOWNLIST)
    Local $btnInventory = GUICtrlCreateButton("Inventory", 250, 438, 90, 32)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 485, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 415, 485, 110, 35)
    
    GUISetState(@SW_SHOW, $hNPCDlgGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNPCDlgGUI)
            Return
        EndIf
    WEnd
EndFunc
