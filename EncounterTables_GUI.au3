#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenEncounterTablesGUI($hParent)
    Local $hEncGUI = GUICreate("Encounter Tables", 650, 480, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Encounter Table Name:", 20, 20, 150, 20)
    GUICtrlCreateInput("", 170, 18, 200, 22)
    
    GUICtrlCreateLabel("Rate:", 380, 20, 40, 20)
    GUICtrlCreateInput("", 425, 18, 50, 22)
    
    GUICtrlCreateLabel("Chance:", 490, 20, 50, 20)
    GUICtrlCreateInput("", 545, 18, 50, 22)
    
    ; Table List
    Local $lbTables = GUICtrlCreateList("", 20, 60, 200, 320, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnNewTable = GUICtrlCreateButton("New", 20, 390, 95, 25)
    Local $btnDelTable = GUICtrlCreateButton("Delete", 125, 390, 95, 25)
    
    ; Specific Encounter Data
    GUICtrlCreateGroup("Specific Encounter Data", 240, 60, 390, 320)
    
    GUICtrlCreateLabel("Encounter Name:", 255, 85, 100, 20)
    GUICtrlCreateInput("", 360, 82, 180, 22)
    
    GUICtrlCreateLabel("Max Num:", 255, 115, 60, 20)
    GUICtrlCreateInput("", 320, 112, 60, 22)
    
    ; Spawn Chance Text Items (Simplified representation)
    GUICtrlCreateLabel("There is a % chance that the following npcs will spawn", 255, 150, 300, 40)
    
    ; List of possible spawns placeholder
    For $i = 0 To 3
        GUICtrlCreateButton("Select NPC", 255, 200 + ($i * 35), 80, 22)
        GUICtrlCreateInput("", 340, 200 + ($i * 35), 150, 22, $ES_READONLY)
    Next
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 470, 430, 80, 25)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 560, 430, 80, 25)
    
    GUISetState(@SW_SHOW, $hEncGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hEncGUI)
            Return
        EndIf
    WEnd
EndFunc
