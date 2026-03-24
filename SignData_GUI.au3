#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenSignDataGUI($hParent)
    Local $hSignGUI = GUICreate("Sign Data", 400, 300, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $txtSign = GUICtrlCreateEdit("", 15, 15, 370, 230, BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL))
    
    Local $btnDone = GUICtrlCreateButton("Done", 160, 260, 80, 25)
    
    GUISetState(@SW_SHOW, $hSignGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hSignGUI)
            Return
        EndIf
    WEnD
EndFunc
