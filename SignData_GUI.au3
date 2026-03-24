#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenSignDataGUI($hParent)
    Local $hSignGUI = GUICreate("Sign Data", 500, 400, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $txtSign = GUICtrlCreateEdit("", 20, 20, 460, 300, BitOR($ES_MULTILINE, $ES_WANTRETURN, $WS_VSCROLL))
    GUICtrlSetFont(-1, 10)
    
    Local $btnDone = GUICtrlCreateButton("Done", 200, 345, 100, 35)
    
    GUISetState(@SW_SHOW, $hSignGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hSignGUI)
            Return
        EndIf
    WEnd
EndFunc
