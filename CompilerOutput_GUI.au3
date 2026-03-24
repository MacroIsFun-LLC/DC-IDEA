#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenCompilerOutputGUI($hParent)
    Local $hCompGUI = GUICreate("Compiler Output", 700, 750, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $txtOutput = GUICtrlCreateEdit("", 15, 15, 670, 660, BitOR($ES_MULTILINE, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $WS_VSCROLL))
    GUICtrlSetFont(-1, 10, 400, 0, "Courier New")
    
    Local $btnDone = GUICtrlCreateButton("Done", 310, 695, 80, 35)
    
    GUISetState(@SW_SHOW, $hCompGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hCompGUI)
            Return
        EndIf
    WEnd
EndFunc
