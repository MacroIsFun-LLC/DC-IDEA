#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenMapEditorGUI($hParent)
    Local $hMapGUI = GUICreate("Map Editor", 1000, 600, -1, -1, BitOR($WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Left Sidebar (Tools)
    GUICtrlCreateGroup("Tools", 10, 10, 180, 500)
    GUICtrlCreateButton("Paint Tiles", 20, 30, 160, 30)
    GUICtrlCreateButton("Erase Tiles", 20, 70, 160, 30)
    GUICtrlCreateButton("Place Object", 20, 110, 160, 30)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Main Drawing Area
    GUICtrlCreateLabel("", 200, 10, 780, 580, $SS_SUNKEN)
    GUICtrlSetBkColor(-1, 0x000000)
    
    Local $btnClose = GUICtrlCreateButton("Close Editor", 10, 550, 180, 30)
    
    GUISetState(@SW_SHOW, $hMapGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hMapGUI)
            Return
        EndIf
    WEnd
EndFunc
