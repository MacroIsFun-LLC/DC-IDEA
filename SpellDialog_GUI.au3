#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>
#include <ComboConstants.au3>

Func _OpenSpellEditorGUI($hParent)
    Local $hSpellGUI = GUICreate("Spell Dialog", 680, 480, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Spell List:", 25, 25, 80, 24)
    Local $lbSpells = GUICtrlCreateList("", 25, 55, 220, 340, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 25, 410, 105, 35)
    Local $btnDel = GUICtrlCreateButton("Delete", 140, 410, 105, 35)
    
    ; Spell Properties Group
    GUICtrlCreateGroup("Spell Properties", 265, 25, 390, 370)
    
    GUICtrlCreateLabel("Spell Name:", 285, 65, 100, 24)
    GUICtrlCreateInput("", 390, 62, 240, 24)
    
    GUICtrlCreateLabel("Mana Usage:", 285, 105, 110, 24)
    GUICtrlCreateInput("", 400, 102, 75, 24, $ES_NUMBER)
    Local $btnEditCode = GUICtrlCreateButton("Edit Code", 550, 102, 90, 32)
    
    GUICtrlCreateLabel("Target:", 285, 145, 85, 24)
    GUICtrlCreateCombo("", 380, 143, 180, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Area:", 285, 185, 85, 24)
    GUICtrlCreateInput("", 380, 182, 100, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Spell Levels:", 285, 230, 120, 24)
    Local $aLevels[8]
    For $i = 0 To 7
        $aLevels[$i] = GUICtrlCreateRadio($i + 1, 285 + ($i * 45), 260, 42, 24)
    Next
    
    GUICtrlCreateLabel("Effects magery skill by:", 285, 300, 180, 24)
    GUICtrlCreateInput("", 470, 298, 75, 24)
    
    GUICtrlCreateLabel("Minimum Magery Required:", 285, 340, 200, 24)
    GUICtrlCreateInput("", 490, 338, 75, 24)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnDone = GUICtrlCreateButton("Done", 575, 415, 90, 35)
    
    GUISetState(@SW_SHOW, $hSpellGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hSpellGUI)
            Return
        EndIf
    WEnd
EndFunc
