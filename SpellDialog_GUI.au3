#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>
#include <ComboConstants.au3>

Func _OpenSpellEditorGUI($hParent)
    Local $hSpellGUI = GUICreate("Spell Dialog", 600, 400, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Spell List:", 20, 20, 60, 20)
    Local $lbSpells = GUICtrlCreateList("", 20, 45, 180, 280, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 20, 340, 85, 25)
    Local $btnDel = GUICtrlCreateButton("Delete", 115, 340, 85, 25)
    
    ; Spell Properties Group
    GUICtrlCreateGroup("Spell Properties", 220, 20, 360, 305)
    
    GUICtrlCreateLabel("Spell Name:", 235, 45, 80, 20)
    GUICtrlCreateInput("", 320, 42, 240, 22)
    
    GUICtrlCreateLabel("Mana Usage:", 235, 75, 80, 20)
    GUICtrlCreateInput("", 320, 72, 60, 22, $ES_NUMBER)
    Local $btnEditCode = GUICtrlCreateButton("Edit Code", 480, 72, 80, 25)
    
    GUICtrlCreateLabel("Target:", 235, 110, 60, 20)
    GUICtrlCreateCombo("", 300, 108, 150, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Area:", 235, 140, 60, 20)
    GUICtrlCreateInput("", 300, 138, 80, 22, $ES_NUMBER)
    
    GUICtrlCreateLabel("Spell Levels:", 235, 180, 100, 20)
    Local $aLevels[8]
    For $i = 0 To 7
        $aLevels[$i] = GUICtrlCreateRadio($i + 1, 235 + ($i * 40), 205, 35, 20)
    Next
    
    GUICtrlCreateLabel("Effects magery skill by:", 235, 240, 150, 20)
    GUICtrlCreateInput("", 390, 238, 60, 22)
    
    GUICtrlCreateLabel("Minimum Magery Required:", 235, 270, 160, 20)
    GUICtrlCreateInput("", 400, 268, 60, 22)
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnDone = GUICtrlCreateButton("Done", 510, 340, 70, 25)
    
    GUISetState(@SW_SHOW, $hSpellGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hSpellGUI)
            Return
        EndIf
    WEnd
EndFunc
