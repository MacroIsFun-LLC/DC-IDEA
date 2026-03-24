#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenArmorDataGUI($hParent)
    Local $hArmorGUI = GUICreate("Armor Data", 450, 350, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Type:", 20, 20, 40, 20)
    GUICtrlCreateCombo("", 70, 18, 150, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Alignment:", 240, 20, 60, 20)
    GUICtrlCreateCombo("", 310, 18, 120, 20, $CBS_DROPDOWNLIST)
    
    GUICtrlCreateLabel("Protection Value:", 20, 50, 100, 20)
    GUICtrlCreateInput("", 130, 48, 90, 22)
    
    ; Flags
    GUICtrlCreateGroup("Flags", 20, 80, 180, 80)
    GUICtrlCreateCheckbox("Can be repaired", 35, 100, 140, 20)
    GUICtrlCreateCheckbox("Magic", 35, 130, 100, 20)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Attribute Requirements
    GUICtrlCreateGroup("Attribute Requirements", 215, 80, 215, 180)
    Local $aAttribs = ["Min Level", "Min Str", "Min Int", "Min Dex", "Min Con"]
    For $i = 0 To UBound($aAttribs) - 1
        GUICtrlCreateLabel($aAttribs[$i] & ":", 230, 105 + ($i * 30), 80, 20)
        GUICtrlCreateInput("", 320, 102 + ($i * 30), 80, 22, $ES_NUMBER)
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Min Health:", 20, 180, 80, 20)
    GUICtrlCreateInput("", 110, 178, 90, 22)
    
    GUICtrlCreateLabel("Max Health:", 20, 210, 80, 20)
    GUICtrlCreateInput("", 110, 208, 90, 22)
    
    Local $btnOK = GUICtrlCreateButton("OK", 20, 300, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 350, 300, 80, 25)
    
    GUISetState(@SW_SHOW, $hArmorGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hArmorGUI)
            Return
        EndIf
    WEnd
EndFunc
