#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenFactionsGUI($hParent)
    Local $hFactGUI = GUICreate("Faction Editor", 450, 400, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 30, 30, 60, 24)
    GUICtrlCreateInput("", 100, 28, 300, 24)
    
    GUICtrlCreateLabel("Abrev:", 30, 75, 60, 24)
    GUICtrlCreateInput("", 100, 73, 80, 24)
    
    Local $btnMembers = GUICtrlCreateButton("Members", 50, 130, 150, 35)
    Local $btnTitles = GUICtrlCreateButton("Titles", 250, 130, 150, 35)
    
    GUICtrlCreateLabel("Faction Properties / Relationships Area", 30, 190, 390, 130, BitOR($SS_SUNKEN, $SS_CENTER, $SS_CENTERIMAGE))
    
    Local $btnClose = GUICtrlCreateButton("Done", 175, 345, 100, 35)
    
    GUISetState(@SW_SHOW, $hFactGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hFactGUI)
            Return
        EndIf
    WEnd
EndFunc
