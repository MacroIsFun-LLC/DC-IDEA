#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>

Func _OpenFactionsGUI($hParent)
    Local $hFactGUI = GUICreate("Faction Editor", 350, 320, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Name:", 30, 20, 50, 20)
    GUICtrlCreateInput("", 90, 18, 200, 22)
    
    GUICtrlCreateLabel("Abrev:", 30, 50, 50, 20)
    GUICtrlCreateInput("", 90, 48, 50, 22)
    
    Local $btnMembers = GUICtrlCreateButton("Members", 40, 100, 100, 30)
    Local $btnTitles = GUICtrlCreateButton("Titles", 180, 100, 100, 30)
    
    GUICtrlCreateLabel("Faction Properties Placeholder", 30, 150, 290, 100, $SS_SUNKEN)
    
    GUISetState(@SW_SHOW, $hFactGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hFactGUI)
            Return
        EndIf
    WEnd
EndFunc
