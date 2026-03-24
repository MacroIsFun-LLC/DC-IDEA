#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenTextInputGUI($hParent)
    Local $hTextInputGUI = GUICreate("Text Input Dialog", 480, 550, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Please enter text below or select a template:", 25, 20, 350, 24)
    Local $lbTemplates = GUICtrlCreateList("", 25, 55, 250, 150, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 350, 20, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 350, 70, 110, 35)
    
    GUICtrlCreateLabel("Edit Area:", 25, 220, 100, 24)
    Local $txtInput = GUICtrlCreateEdit("", 20, 250, 440, 270, BitOR($ES_MULTILINE, $WS_VSCROLL))
    GUICtrlSetFont(-1, 10)
    
    GUISetState(@SW_SHOW, $hTextInputGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTextInputGUI)
            Return
        EndIf
    WEnd
EndFunc
