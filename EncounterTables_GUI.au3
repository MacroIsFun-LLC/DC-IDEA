#include-once
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <StaticConstants.au3>
#include <ListBoxConstants.au3>

Func _OpenEncounterTablesGUI($hParent)
    Local $hEncGUI = GUICreate("Encounter Tables", 780, 580, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), -1, $hParent)
    
    GUICtrlCreateLabel("Encounter Table Name:", 25, 25, 180, 24)
    GUICtrlCreateInput("", 210, 23, 250, 24)
    
    GUICtrlCreateLabel("Rate:", 475, 25, 50, 24)
    GUICtrlCreateInput("", 530, 23, 65, 24)
    
    GUICtrlCreateLabel("Chance:", 610, 25, 65, 24)
    GUICtrlCreateInput("", 680, 23, 65, 24)
    
    ; Table List
    Local $lbTables = GUICtrlCreateList("", 25, 75, 240, 380, BitOR($LBS_NOTIFY, $WS_VSCROLL, $WS_BORDER))
    Local $btnNewTable = GUICtrlCreateButton("New", 25, 465, 115, 35)
    Local $btnDelTable = GUICtrlCreateButton("Delete", 150, 465, 115, 35)
    
    ; Specific Encounter Data
    GUICtrlCreateGroup("Specific Encounter Data", 285, 75, 470, 380)
    
    GUICtrlCreateLabel("Encounter Name:", 305, 110, 120, 24)
    GUICtrlCreateInput("", 430, 107, 250, 24)
    
    GUICtrlCreateLabel("Max Num:", 305, 155, 85, 24)
    GUICtrlCreateInput("", 400, 152, 80, 24)
    
    ; Spawn Chance Text Items (Simplified representation)
    GUICtrlCreateLabel("There is a % chance that the following npcs will spawn", 305, 195, 430, 50)
    
    ; List of possible spawns placeholder
    For $i = 0 To 3
        GUICtrlCreateButton("Select NPC", 305, 260 + ($i * 48), 110, 32)
        GUICtrlCreateInput("", 425, 264 + ($i * 48), 240, 24, $ES_READONLY)
    Next
    
    GUICtrlCreateGroup("", -99, -99, 1, 1)
    
    Local $btnOK = GUICtrlCreateButton("OK", 535, 520, 110, 35)
    Local $btnCancel = GUICtrlCreateButton("Cancel", 655, 520, 110, 35)
    
    GUISetState(@SW_SHOW, $hEncGUI)
    
    While 1
        $nMsg = GUIGetMsg()
        If $nMsg = $GUI_EVENT_CLOSE Or $nMsg = $btnCancel Or $nMsg = $btnOK Then
            GUIDelete($hEncGUI)
            Return
        EndIf
    WEnd
EndFunc
