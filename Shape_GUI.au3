#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShapeGUI($hParent)
    Local $hShapeGUI = GUICreate("Shape List", 340, 520, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Shape List:", 25, 20, 120, 24)
    Local $lbShapes = GUICtrlCreateList("", 25, 50, 290, 300, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnImport = GUICtrlCreateButton("Import", 25, 365, 130, 35)
    Local $btnDelete = GUICtrlCreateButton("Delete", 185, 365, 130, 35)
    
    Local $btnCapture = GUICtrlCreateButton("Capture", 25, 410, 130, 35)
    Local $btnReCapture = GUICtrlCreateButton("Re-Capture", 185, 410, 130, 35)
    
    Local $btnPreview = GUICtrlCreateButton("Preview", 25, 455, 130, 35)
    Local $btnRename = GUICtrlCreateButton("Rename", 185, 455, 130, 35)
    
    Local $btnExportPalette = GUICtrlCreateButton("Export Palette", 90, 500, 160, 32)
    
    GUISetState(@SW_SHOW, $hShapeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hShapeGUI)
            Return
        EndIf
    WEnd
EndFunc
