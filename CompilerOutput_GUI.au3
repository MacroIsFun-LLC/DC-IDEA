#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Func _OpenCompilerOutputGUI($hParent)
    Local $hCompGUI = GUICreate("Compiler Output", 600, 650, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    Local $txtOutput = GUICtrlCreateEdit("", 10, 10, 580, 580, BitOR($ES_MULTILINE, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_READONLY, $WS_VSCROLL))
    GUICtrlSetFont(-1, 9, 400, 0, "Courier New")
    
    Local $btnDone = GUICtrlCreateButton("Done", 260, 605, 80, 30)
    
    GUISetState(@SW_SHOW, $hCompGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnDone Then
            GUIDelete($hCompGUI)
            Return
        EndIf
    WEnd
EndFunc
