#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <ListBoxConstants.au3>
#include <StaticConstants.au3>

Func _OpenSpriteEditorGUI($hParent)
    Local $hSpriteGUI = GUICreate("Sprite Editor Dialog", 550, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateGroup("Sprite Data", 15, 15, 520, 150)
    GUICtrlCreateLabel("Name:", 30, 40, 50, 20)
    GUICtrlCreateInput("", 85, 38, 180, 24)
    
    GUICtrlCreateLabel("Sprite Animation Sequence:", 30, 75, 180, 20)
    Local $aFrames[8]
    For $i = 0 To 7
        $aFrames[$i] = GUICtrlCreateLabel("", 30 + ($i * 60), 100, 50, 50, BitOR($SS_SUNKEN, $SS_CENTERIMAGE, $SS_NOTIFY))
    Next
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $lbSprites = GUICtrlCreateList("", 15, 175, 250, 230, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnNew = GUICtrlCreateButton("New", 320, 250, 80, 30)
    Local $btnDelete = GUICtrlCreateButton("Delete", 320, 300, 80, 30)
    
    Local $btnClose = GUICtrlCreateButton("Close", 450, 400, 80, 25)
    
    GUISetState(@SW_SHOW, $hSpriteGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnClose Then
            GUIDelete($hSpriteGUI)
            Return
        EndIf
    WEnd
EndFunc
