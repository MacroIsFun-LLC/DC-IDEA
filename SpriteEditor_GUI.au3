#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>
#include <StaticConstants.au3>

Func _OpenSpriteEditorGUI($hParent)
    Local $hSpriteGUI = GUICreate("Sprite Editor Dialog", 650, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateGroup("Sprite Data", 15, 15, 620, 180)
    GUICtrlCreateLabel("Name:", 35, 45, 60, 24)
    GUICtrlCreateInput("", 100, 42, 250, 26)
    
    GUICtrlCreateLabel("Sprite Animation Sequence:", 35, 80, 200, 24)
    Local $aFrames[8]
    For $i = 0 To 7
        $aFrames[$i] = GUICtrlCreateLabel("", 35 + ($i * 72), 110, 60, 60, BitOR($SS_SUNKEN, $SS_CENTERIMAGE, $SS_NOTIFY))
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    GUICtrlCreateLabel("Sprite List:", 15, 205, 120, 24)
    Local $lbSprites = GUICtrlCreateList("", 15, 235, 300, 240, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 350, 250, 110, 35)
    Local $btnDelete = GUICtrlCreateButton("Delete", 350, 305, 110, 35)
    
    Local $btnClose = GUICtrlCreateButton("Close", 520, 465, 110, 35)
    
    GUISetState(@SW_SHOW, $hSpriteGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hSpriteGUI)
            Return
        EndIf
    WEnd
EndFunc
