#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenNPCDialogGUI($hParent)
    Local $hNPCDlgGUI = GUICreate("Npc Dialog", 450, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 30, 20, 50, 20)
    GUICtrlCreateInput("", 85, 18, 250, 22)
    
    ; Attributes Group
    GUICtrlCreateGroup("Attributes", 25, 60, 180, 200)
    Local $aAttribsL = ["Strength", "Intelligence", "Dexterity", "Constitution"]
    For $i = 0 To UBound($aAttribsL) - 1
        GUICtrlCreateLabel($aAttribsL[$i] & ":", 35, 85 + ($i * 25), 80, 20)
        GUICtrlCreateInput("", 120, 82 + ($i * 25), 70, 20, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Right Side Attributes
    GUICtrlCreateLabel("Health:", 220, 85, 60, 20)
    GUICtrlCreateInput("", 290, 82, 60, 20, $ES_NUMBER)
    
    GUICtrlCreateLabel("Max Health:", 220, 110, 70, 20)
    GUICtrlCreateInput("", 290, 107, 60, 20, $ES_NUMBER)
    
    GUICtrlCreateLabel("Level:", 220, 135, 50, 20)
    GUICtrlCreateInput("", 290, 132, 60, 20, $ES_NUMBER)
    
    GUICtrlCreateLabel("Mana:", 220, 160, 40, 20)
    GUICtrlCreateInput("", 290, 157, 60, 20, $ES_NUMBER)
    
    GUICtrlCreateLabel("Armorclass:", 220, 185, 70, 20)
    GUICtrlCreateInput("", 290, 182, 60, 20, $ES_NUMBER)
    
    ; Alignment Group
    GUICtrlCreateGroup("Alignment", 25, 275, 340, 60)
    GUICtrlCreateInput("", 40, 295, 60, 22, $ES_NUMBER)
    Local $btnGood = GUICtrlCreateButton("Good", 110, 295, 60, 25)
    Local $btnNeutral = GUICtrlCreateButton("Neutral", 180, 295, 60, 25)
    Local $btnEvil = GUICtrlCreateButton("Evil", 250, 295, 60, 25)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Activity:", 30, 350, 50, 20)
    GUICtrlCreateCombo("", 90, 348, 150, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Shop Type:", 30, 385, 60, 20)
    GUICtrlCreateCombo("", 90, 383, 100, 20, $CBS_DROPDOWNLIST)
    Local $btnInventory = GUICtrlCreateButton("Inventory", 200, 383, 70, 25)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 420, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 350, 420, 80, 25)
    
    GUISetState(@SW_SHOW, $hNPCDlgGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hNPCDlgGUI)
            Return
        EndIf
    WEnd
EndFunc
