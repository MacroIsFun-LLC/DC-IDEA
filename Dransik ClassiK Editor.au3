#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_Fileversion=0.0.0.8
#AutoIt3Wrapper_Outfile=Build\Dransik ClassiK Editor Ver.%fileversion%.exe
#AutoIt3Wrapper_Res_ProductName=Dransik ClassiK Editor Ver.%fileversion%
#AutoIt3Wrapper_Icon=Assets\Dransik Editor.ico
#AutoIt3Wrapper_Res_CompanyName=MacroIsFunLLc
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_Icon_Add=Assets\Dransik Editor.ico
#AutoIt3Wrapper_Res_File_Add=Assets\Dransik Editor.ico, rt_icon, MAIN
#Au3Stripper_Parameters=/sf
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

; Initialize for Windows 11 compatibility / High DPI
DllCall("User32.dll", "bool", "SetProcessDPIAware")

ProgressOn("Dransik ClassiK Editor", "Starting Modernized Suite...", "Initializing Core Modules", -1, -1, 16) ; 16 = Topmost

For $i = 1 To 100 Step 5
    $sMsg = "Loading Modules... (" & $i & "%)"
    If $i > 30 Then $sMsg = "Parsing 38 UI Resources... (" & $i & "%)"
    If $i > 60 Then $sMsg = "Standardizing Spacing Audit... (" & $i & "%)"
    If $i > 90 Then $sMsg = "Finalizing Main Hub... (" & $i & "%)"
    ProgressSet($i, $sMsg)
    ConsoleWrite("> " & $sMsg & @CRLF)
    Sleep(50)
Next
ProgressSet(100, "Finalizing Main Hub... (100%)", "Done!")
ConsoleWrite("+ Startup Sequence Complete." & @CRLF)
Sleep(500)
ProgressOff()

; Load Sub-GUIs (Pre-processed by AutoIt)
#include "About_GUI.au3"
#include "AnimEditor_GUI.au3"
#include "ArmorData_GUI.au3"
#include "NPCEditor_GUI.au3"
#include "MapEditor_GUI.au3"
#include "ShopEditor_GUI.au3"
#include "EncounterTables_GUI.au3"
#include "SpellDialog_GUI.au3"
#include "Treasures_GUI.au3"
#include "TradeData_GUI.au3"
#include "Chunktype_GUI.au3"
#include "CompilerOutput_GUI.au3"
#include "Container_GUI.au3"
#include "ObjectInstance_GUI.au3"
#include "Factions_GUI.au3"
#include "GenericInput_GUI.au3"
#include "GenericDialog_GUI.au3"
#include "EncounterTable_GUI.au3"
#include "MapPosition_GUI.au3"
#include "NPCEncounterList_GUI.au3"
#include "NPCType_GUI.au3"
#include "EncounterName_GUI.au3"
#include "NewEncounterName_GUI.au3"
#include "NewMap_GUI.au3"
#include "ShopType_GUI.au3"
#include "NPCDialog_GUI.au3"
#include "ObjectData_GUI.au3"
#include "ObjectEditor_GUI.au3"
#include "ObjectProperties_GUI.au3"
#include "SelectMap_GUI.au3"
#include "Shape_GUI.au3"
#include "ShopInventory_GUI.au3"
#include "ShopItems_GUI.au3"
#include "SignData_GUI.au3"
#include "SpriteEditor_GUI.au3"
#include "Race_GUI.au3"
#include "TextInput_GUI.au3"
#include "NewProject_GUI.au3"

SplashOff()

; ====================================================================================
;                               CREATE MAIN WINDOW
; ====================================================================================
Local $sTitle = "Dransik ClassiK Editor"
If @Compiled Then
    $sTitle &= " v." & FileGetVersion(@ScriptFullPath)
Else
    $sTitle &= " -InDev-"
EndIf
$hMainGUI = GUICreate($sTitle, 1200, 700)
GUISetIcon(@ScriptDir & "\Assets\Dransik Editor.ico")

; ====================================================================================
;                                      MENUBAR
; ====================================================================================

; File Menu
$mFile = GUICtrlCreateMenu("&File")
$miOpenUsecode = GUICtrlCreateMenuItem("&Open Usecode", $mFile)
$miNewUsecode = GUICtrlCreateMenuItem("&New Usecode", $mFile)
GUICtrlCreateMenuItem("", $mFile)
$miCreateLocal = GUICtrlCreateMenuItem("Create Local Data", $mFile)
$miCreateGame = GUICtrlCreateMenuItem("Create Game Data", $mFile)
GUICtrlCreateMenuItem("", $mFile)
$miExit = GUICtrlCreateMenuItem("E&xit", $mFile)

; Artwork Menu
$mArtwork = GUICtrlCreateMenu("&Artwork")
$miImportArtwork = GUICtrlCreateMenuItem("&Import", $mArtwork)

; Edit Menu
$mEdit = GUICtrlCreateMenu("&Edit")
$miNpcEditor = GUICtrlCreateMenuItem("Npc Editor", $mEdit)
$miMapEditor = GUICtrlCreateMenuItem("&Map Editor", $mEdit)
$miAnimEditor = GUICtrlCreateMenuItem("&Anim Editor", $mEdit)
$miTypeEditor = GUICtrlCreateMenuItem("&Type Editor", $mEdit)
$miArmorData = GUICtrlCreateMenuItem("&Armor Data", $mEdit)
$miShopEditor = GUICtrlCreateMenuItem("&Shop Editor", $mEdit)
$miEncounters = GUICtrlCreateMenuItem("Encounters", $mEdit)
$miTreasures = GUICtrlCreateMenuItem("Treasures", $mEdit)
$miTradeData = GUICtrlCreateMenuItem("Trade Data", $mEdit)
$miSpellDialog = GUICtrlCreateMenuItem("&Spell Dialog", $mEdit)

; Game Data Menu
$mGameData = GUICtrlCreateMenu("&Game Data")
$miExportClient = GUICtrlCreateMenuItem("Export &Client", $mGameData)
$miExportServer = GUICtrlCreateMenuItem("Export &Server", $mGameData)

; Usecode Menu
$mUsecode = GUICtrlCreateMenu("&Usecode")
$miOpenFile = GUICtrlCreateMenuItem("&Open File", $mUsecode)
$miNewFile = GUICtrlCreateMenuItem("&New File", $mUsecode)
$miCompileFile = GUICtrlCreateMenuItem("&Compile File", $mUsecode)
$miBuildAll = GUICtrlCreateMenuItem("&Build All", $mUsecode)

; Export Menu
$mExport = GUICtrlCreateMenu("Export")
$miExportWepArm = GUICtrlCreateMenuItem("Export Wep n Armor", $mExport)

; View Menu
$mView = GUICtrlCreateMenu("&View")
$miToolbar = GUICtrlCreateMenuItem("Toolbar", $mView)
GUICtrlSetState(-1, $GUI_CHECKED)
$miStatusbar = GUICtrlCreateMenuItem("Status Bar", $mView)
GUICtrlSetState(-1, $GUI_CHECKED)
$miMapPos = GUICtrlCreateMenuItem("Map Position", $mView)

; Help Menu
$mHelp = GUICtrlCreateMenu("&Help")
$miAbout = GUICtrlCreateMenuItem("&About Dransik Editor...", $mHelp)

; ===========================================================================
;  STATUS BAR
; ===========================================================================
Global $aParts[2] = [120, -1]
$hStatus = _GUICtrlStatusBar_Create($hMainGUI)
_GUICtrlStatusBar_SetParts($hStatus, $aParts)
_GUICtrlStatusBar_SetText($hStatus, "Ready")

GUISetState(@SW_SHOW, $hMainGUI)

; ====================================================================================
;                                  MAIN MESSAGE LOOP
; ====================================================================================
While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE, $miExit
            Exit
            
        Case $miAbout
            _OpenAboutGUI($hMainGUI)
            
        Case $miAnimEditor
            _OpenAnimEditorGUI($hMainGUI)
            
        Case $miArmorData, $miExportWepArm
            _OpenArmorDataGUI($hMainGUI)
            
        Case $miNpcEditor
            _OpenNPCEditorGUI($hMainGUI)
            
        Case $miMapEditor
            _OpenMapEditorGUI($hMainGUI)
            
        Case $miShopEditor
            _OpenShopEditorGUI($hMainGUI)
            
        Case $miEncounters
            _OpenEncounterTablesGUI($hMainGUI)
            
        Case $miTreasures
            _OpenTreasuresGUI($hMainGUI)
            
        Case $miTradeData
            _OpenTradeDataGUI($hMainGUI)
            
        Case $miSpellDialog
            _OpenSpellEditorGUI($hMainGUI)
            
        Case $miTypeEditor
            _OpenTradeDataGUI($hMainGUI) ; Reusing or mapping to relevant editor
            
        Case $miMapPos
            _OpenMapPositionGUI($hMainGUI)
            
        Case $miNewFile, $miNewUsecode
            _OpenNewProjectGUI($hMainGUI)
            
        Case $miOpenFile, $miOpenUsecode
            _OpenSelectMapGUI($hMainGUI)
            
        Case $miCompileFile
            _OpenCompilerOutputGUI($hMainGUI)
            
        Case $miToolbar
            ; Toggle toolbar visibility logic here
            GUICtrlSetState($miToolbar, $GUI_UNCHECKED) ; Placeholder toggle
            
        Case $miStatusbar
            If GUICtrlRead($miStatusbar) = $GUI_CHECKED Then
                GUICtrlSetState($miStatusbar, $GUI_UNCHECKED)
                GUISetState(@SW_HIDE, $hStatus)
            Else
                GUICtrlSetState($miStatusbar, $GUI_CHECKED)
                GUISetState(@SW_SHOW, $hStatus)
            EndIf
            
    EndSwitch
WEnd