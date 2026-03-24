#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenTextInputGUI($hParent)
    ; Mapped from TextInputGui.txt which has "Race Dialog" caption in the resources
    Local $hTextInputGUI = GUICreate("Text Input Dialog", 400, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Please enter text below:", 20, 20, 200, 20)
    Local $lbTemplates = GUICtrlCreateList("", 15, 45, 180, 130, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnOK = GUICtrlCreateButton("OK", 270, 15, 80, 30)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 270, 55, 80, 30)
    
    Local $txtInput = GUICtrlCreateEdit("", 15, 200, 370, 220, BitOR($ES_MULTILINE, $WS_VSCROLL))
    
    GUISetState(@SW_SHOW, $hTextInputGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hTextInputGUI)
            Return
        EndIf
    WEnd
EndFunc
