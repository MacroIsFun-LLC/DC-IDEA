#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>

Func _OpenAboutGUI($hParent)
    ; Dimensions provided by user
    Local $iPaneW = 654
    Local $iPaneH = 408
    
    ; Main GUI Size
    Local $iMainW = 750
    Local $iMainH = 650
    
    Local $hAboutGUI = GUICreate("About Dransik Editor", $iMainW, $iMainH, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    GUISetIcon(@ScriptDir & "\Assets\Dransik Editor.ico")
    
    ; Randomized selection (1 to 4)
    Local $iPane = Random(1, 4, 1)
    Local $iOffsetX = 0
    Local $iOffsetY = 0
    
    Switch $iPane
        Case 1 ; Top Left
            $iOffsetX = 0
            $iOffsetY = 0
        Case 2 ; Top Right
            $iOffsetX = -$iPaneW
            $iOffsetY = 0
        Case 3 ; Bottom Left
            $iOffsetX = 0
            $iOffsetY = -$iPaneH
        Case 4 ; Bottom Right
            $iOffsetX = -$iPaneW
            $iOffsetY = -$iPaneH
    EndSwitch
    
    ; Create Viewport Window (Centered)
    Local $iViewX = Int(($iMainW - $iPaneW) / 2)
    Local $iViewY = 30
    Local $hViewport = GUICreate("", $iPaneW, $iPaneH, $iViewX, $iViewY, $WS_CHILD, -1, $hAboutGUI)
    
    ; Use full path for the image
    Local $sImgPath = @ScriptDir & "\Assets\AboutGUI.png"
    If FileExists($sImgPath) Then
        ; Create the picture control in the viewport context
        ; We use the full image size (654*2 x 408*2 = 1308 x 816)
        GUICtrlCreatePic($sImgPath, $iOffsetX, $iOffsetY, 1308, 816)
    Else
        GUICtrlCreateLabel("IMAGE NOT FOUND: " & $sImgPath, 0, 0, $iPaneW, $iPaneH, BitOR($SS_CENTER, $SS_CENTERIMAGE))
        GUICtrlSetColor(-1, 0xFFFFFF)
        GUISetBkColor(0x880000, $hViewport)
    EndIf
    
    GUISetState(@SW_SHOW, $hViewport)
    GUISwitch($hAboutGUI)
    
    ; Disclaimer Text
    GUICtrlCreateLabel("This is a Fan Product, It does not contian Any of Dransik Real code.", 20, $iPaneH + 60, $iMainW - 40, 60, $SS_CENTER)
    GUICtrlSetFont(-1, 12, 800, 0, "Arial")
    GUICtrlSetColor(-1, 0xE74C3C) ; Professional Alizarin Red
    
    GUICtrlCreateLabel("Copyright (C) 1999 Asylumsoft", 20, $iPaneH + 130, $iMainW - 40, 24, $SS_CENTER)
    GUICtrlSetFont(-1, 10, 400)
    
    Local $btnOK = GUICtrlCreateButton("OK", ($iMainW - 120) / 2, $iMainH - 60, 120, 35)
    
    GUISetState(@SW_SHOW, $hAboutGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnOK Then
            GUIDelete($hViewport)
            GUIDelete($hAboutGUI)
            Return
        EndIf
    WEnd
EndFunc
