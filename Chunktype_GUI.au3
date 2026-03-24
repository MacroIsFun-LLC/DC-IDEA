#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenChunktypeGUI($hParent)
    Local $hChunkGUI = GUICreate("Chunk Type", 280, 480, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateGroup("Current Chunk", 15, 15, 250, 170)
    GUICtrlCreateCheckbox("Newbie", 40, 45, 120, 25)
    GUICtrlCreateCheckbox("Safe Zone", 40, 75, 120, 25)
    GUICtrlCreateCheckbox("Arena Zone", 40, 105, 120, 25)
    GUICtrlCreateCheckbox("Player Owned", 40, 135, 150, 25)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnStartPaint = GUICtrlCreateButton("Start Paint Mode", 15, 200, 250, 35)
    
    GUICtrlCreateGroup("Default when painting", 15, 250, 250, 170)
    GUICtrlCreateCheckbox("Newbie", 40, 280, 120, 25)
    GUICtrlCreateCheckbox("Safe Zone", 40, 310, 120, 25)
    GUICtrlCreateCheckbox("Arena Zone", 40, 340, 120, 25)
    GUICtrlCreateCheckbox("Player Owned", 40, 370, 150, 25)
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnClose = GUICtrlCreateButton("Done", 90, 435, 100, 32)
    
    GUISetState(@SW_SHOW, $hChunkGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hChunkGUI)
            Return
        EndIf
    WEnd
EndFunc
