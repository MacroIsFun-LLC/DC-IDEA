#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenGenericDialogGUI($hParent)
    Local $hDialogGUI = GUICreate("Dialog", 450, 350, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Left side inputs
    Local $aLabelsL = ["To Hit Modifier", "Min Damage", "Max Damage", "Speed", "Min Health", "Max Health"]
    For $i = 0 To UBound($aLabelsL) - 1
        GUICtrlCreateLabel($aLabelsL[$i] & ":", 20, 15 + ($i * 30), 100, 20)
        GUICtrlCreateInput("", 130, 12 + ($i * 30), 80, 22)
    Next
    
    ; Flags
    GUICtrlCreateGroup("Flags", 20, 200, 180, 100)
    GUICtrlCreateCheckbox("Can be repaired", 35, 220, 140, 20)
    GUICtrlCreateCheckbox("Ranged Weapon", 35, 245, 140, 20)
    GUICtrlCreateCheckbox("Magic", 35, 270, 100, 20)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Right side inputs
    GUICtrlCreateLabel("Class:", 230, 15, 60, 20)
    GUICtrlCreateCombo("", 300, 12, 120, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Alignment:", 230, 45, 60, 20)
    GUICtrlCreateCombo("", 300, 42, 120, 20, $CBS_DROPDOWNLIST)
    
    ; Attribute Requirements
    GUICtrlCreateGroup("Attribute Requirements", 230, 80, 200, 180)
    Local $aAttribs = ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 245, 105 + ($i * 30), 80, 20)
        GUICtrlCreateInput("", 335, 102 + ($i * 30), 60, 22, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 310, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 350, 310, 80, 25)
    
    GUISetState(@SW_SHOW, $hDialogGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hDialogGUI)
            Return
        EndIf
    WEnd
EndFunc
