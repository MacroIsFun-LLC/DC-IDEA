#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenMapEditorGUI($hParent)
    Local $hMapGUI = GUICreate("Map Editor", 1100, 650, -1, -1, BitOR($WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_SIZEBOX, $WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    ; Left Sidebar (Tools)
    GUICtrlCreateGroup("Tools", 10, 10, 200, 550)
    GUICtrlCreateButton("Paint Tiles", 25, 40, 170, 35)
    GUICtrlCreateButton("Erase Tiles", 25, 85, 170, 35)
    GUICtrlCreateButton("Place Object", 25, 130, 170, 35)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    ; Main Drawing Area
    GUICtrlCreateLabel("", 220, 10, 865, 630, $SS_SUNKEN)
    GUICtrlSetBkColor(-1, 0x000000)
    
    Local $btnClose = GUICtrlCreateButton("Close Editor", 10, 590, 200, 35)
    
    GUISetState(@SW_SHOW, $hMapGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hMapGUI)
            Return
        EndIf
    WEnd
EndFunc
