#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenChunktypeGUI($hParent)
    Local $hChunkGUI = GUICreate("Chunk Type", 200, 400, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateGroup("Current Chunk", 10, 10, 180, 150)
    GUICtrlCreateCheckbox("Newbie", 30, 35, 100, 20)
    GUICtrlCreateCheckbox("Safe Zone", 30, 60, 100, 20)
    GUICtrlCreateCheckbox("Arena Zone", 30, 85, 100, 20)
    GUICtrlCreateCheckbox("Player Owned", 30, 110, 120, 20)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnStartPaint = GUICtrlCreateButton("Start Paint Mode", 10, 175, 180, 25)
    
    GUICtrlCreateGroup("Default when painting", 10, 215, 180, 140)
    GUICtrlCreateCheckbox("Newbie", 30, 240, 100, 20)
    GUICtrlCreateCheckbox("Safe Zone", 30, 265, 100, 20)
    GUICtrlCreateCheckbox("Arena Zone", 30, 290, 100, 20)
    GUICtrlCreateCheckbox("Player Owned", 30, 315, 120, 20)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUISetState(@SW_SHOW, $hChunkGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hChunkGUI)
            Return
        EndIf
    WEnd
EndFunc
