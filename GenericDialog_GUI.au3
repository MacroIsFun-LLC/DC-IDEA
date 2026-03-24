#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenGenericDialogGUI($hParent)
    Local $hDialogGUI = GUICreate("Dialog", 500, 420, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Left side inputs
    Local $aLabelsL = ["To Hit Modifier", "Min Damage", "Max Damage", "Speed", "Min Health", "Max Health"]
    For $i = 0 To UBound($aLabelsL) - 1
        GUICtrlCreateLabel($aLabelsL[$i] & ":", 25, 20 + ($i * 35), 110, 24)
        GUICtrlCreateInput("", 140, 18 + ($i * 35), 80, 24)
    Next
    
    ; Flags
    GUICtrlCreateGroup("Flags", 20, 240, 210, 120)
    GUICtrlCreateCheckbox("Can be repaired", 35, 265, 160, 24)
    GUICtrlCreateCheckbox("Ranged Weapon", 35, 295, 160, 24)
    GUICtrlCreateCheckbox("Magic", 35, 325, 120, 24)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Right side inputs
    GUICtrlCreateLabel("Class:", 260, 20, 70, 24)
    GUICtrlCreateCombo("", 340, 18, 130, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Alignment:", 260, 55, 75, 24)
    GUICtrlCreateCombo("", 340, 53, 130, 22, $CBS_DROPDOWNLIST)
    
    ; Attribute Requirements
    GUICtrlCreateGroup("Attribute Requirements", 260, 95, 220, 230)
    Local $aAttribs = ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 275, 130 + ($i * 35), 90, 24)
        GUICtrlCreateInput("", 370, 128 + ($i * 35), 80, 24, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 25, 375, 100, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 375, 375, 100, 35)
    
    GUISetState(@SW_SHOW, $hDialogGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hDialogGUI)
            Return
        EndIf
    WEnd
EndFunc
