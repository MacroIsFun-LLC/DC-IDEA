#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenArmorDataGUI($hParent)
    Local $hArmorGUI = GUICreate("Armor Data", 520, 420, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Type:", 20, 20, 50, 24)
    GUICtrlCreateCombo("", 85, 18, 160, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Alignment:", 270, 20, 80, 24)
    GUICtrlCreateCombo("", 360, 18, 140, 22, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Protection Value:", 20, 65, 120, 24)
    GUICtrlCreateInput("", 145, 62, 100, 24)
    
    ; Flags
    GUICtrlCreateGroup("Flags", 20, 110, 210, 110)
    GUICtrlCreateCheckbox("Can be repaired", 35, 140, 170, 24)
    GUICtrlCreateCheckbox("Magic", 35, 175, 100, 24)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Attribute Requirements
    GUICtrlCreateGroup("Attribute Requirements", 250, 110, 250, 230)
    Local $aAttribs = ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 265, 145 + ($i * 35), 110, 24)
        GUICtrlCreateInput("", 385, 142 + ($i * 35), 90, 24, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Min Health:", 20, 240, 110, 24)
    GUICtrlCreateInput("", 135, 238, 95, 24)
    
    GUICtrlCreateLabel("Max Health:", 20, 280, 110, 24)
    GUICtrlCreateInput("", 135, 278, 95, 24)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 365, 100, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 400, 365, 100, 35)
    
    GUISetState(@SW_SHOW, $hArmorGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hArmorGUI)
            Return
        EndIf
    WEnd
EndFunc
