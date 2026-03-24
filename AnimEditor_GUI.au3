#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenAnimEditorGUI($hParent)
    Local $hAnimGUI = GUICreate("Anim Editor", 450, 350, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Animation:", 20, 20, 80, 24)
    GUICtrlCreateInput("", 105, 18, 250, 24)
    
    ; Animation sequence boxes (8 frames)
    Local $aFrames[8]
    For $i = 0 To 7
        $aFrames[$i] = GUICtrlCreateLabel("", 20 + ($i * 52), 65, 48, 48, BitOR($SS_SUNKEN, $SS_CENTERIMAGE))
    Next
    
    ; Animation Controls Group
    GUICtrlCreateGroup("Animation Controls", 15, 140, 420, 130)
    GUICtrlCreateLabel("Speed:", 30, 175, 60, 24)
    GUICtrlCreateInput("100", 100, 172, 70, 24, $ES_NUMBER)
    
    GUICtrlCreateLabel("Frames:", 30, 215, 60, 24)
    GUICtrlCreateInput("8", 100, 212, 70, 24, $ES_NUMBER)
    
    GUICtrlCreateCheckbox("Random Speed", 190, 175, 150, 24)
    
    GUICtrlCreateLabel("Type:", 190, 215, 50, 24)
    GUICtrlCreateCombo("", 250, 213, 150, 22, $CBS_DROPDOWNLIST)
    GUICtrlCreateGroup("", -99, -99, 1, 1) ; close group
    
    Local $btnDone = GUICtrlCreateButton("Done", 360, 305, 80, 25)
    
    GUISetState(@SW_SHOW, $hAnimGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hAnimGUI)
            Return
        EndIf
    WEnd
EndFunc
