#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ComboConstants.au3>

Func _OpenAnimEditorGUI($hParent)
    Local $hAnimGUI = GUICreate("Anim Editor", 400, 280, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Animation:", 20, 20, 60, 20)
    GUICtrlCreateInput("", 85, 18, 200, 22)
    
    ; Animation sequence boxes (8 frames)
    Local $aFrames[8]
    For $i = 0 To 7
        $aFrames[$i] = GUICtrlCreateLabel("", 20 + ($i * 45), 60, 40, 40, BitOR($SS_SUNKEN, $SS_CENTERIMAGE))
    Next
    
    ; Animation Controls Group
    GUICtrlCreateGroup("Animation Controls", 15, 120, 370, 100)
    GUICtrlCreateLabel("Speed:", 30, 145, 40, 20)
    GUICtrlCreateInput("100", 75, 142, 60, 22, $ES_NUMBER)
    
    GUICtrlCreateLabel("Frames:", 30, 175, 45, 20)
    GUICtrlCreateInput("8", 75, 172, 60, 22, $ES_NUMBER)
    
    GUICtrlCreateCheckbox("Random Speed", 160, 145, 120, 20)
    
    GUICtrlCreateLabel("Type:", 160, 175, 40, 20)
    GUICtrlCreateCombo("", 205, 172, 150, 20, $CBS_DROPDOWNLIST)
    GUICtrlCreateGroup("", -99, -99, 1, 1) ; close group
    
    Local $btnDone = GUICtrlCreateButton("Done", 315, 240, 70, 25)
    
    GUISetState(@SW_SHOW, $hAnimGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hAnimGUI)
            Return
        EndIf
    WEnd
EndFunc
