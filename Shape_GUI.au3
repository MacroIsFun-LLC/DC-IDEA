#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenShapeGUI($hParent)
    Local $hShapeGUI = GUICreate("Shape List", 200, 450, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Shape List:", 50, 15, 100, 20)
    Local $lbShapes = GUICtrlCreateList("", 15, 45, 170, 260, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    
    Local $btnImport = GUICtrlCreateButton("Import", 15, 320, 80, 25)
    Local $btnDelete = GUICtrlCreateButton("Delete", 105, 320, 80, 25)
    
    Local $btnCapture = GUICtrlCreateButton("Capture", 15, 355, 80, 25)
    Local $btnReCapture = GUICtrlCreateButton("Re-Capture", 105, 355, 80, 25)
    
    Local $btnPreview = GUICtrlCreateButton("Preview", 15, 390, 80, 25)
    Local $btnRename = GUICtrlCreateButton("Rename", 105, 390, 80, 25)
    
    Local $btnExportPalette = GUICtrlCreateButton("Export Palette", 50, 420, 100, 25)
    
    GUISetState(@SW_SHOW, $hShapeGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Then
            GUIDelete($hShapeGUI)
            Return
        EndIf
    WEnD
EndFunc
