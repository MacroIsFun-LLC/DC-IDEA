#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_Fileversion=0.0.0.4
#AutoIt3Wrapper_Outfile=Dransik ClassiK Editor v.%fileversion%.exe
#AutoIt3Wrapper_Res_ProductName=Dransik ClassiK Editor v.%fileversion%
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

; Load Sub-GUIs
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

; ====================================================================================
;                               CREATE MAIN WINDOW
; ====================================================================================
Local $sVersion = FileGetVersion(@ScriptFullPath)
If @compiled = 0 Then $sVersion = "0.0.0.4 - InDev"
$hMainGUI = GUICreate("Dransik ClassiK Editor v." & $sVersion, 1200, 700)
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
$miShopEditor = GUICtrlCreateMenuItem("&Shop Editor", $mEdit)
$miEncounters = GUICtrlCreateMenuItem("Encounters", $mEdit)
$miTreasures = GUICtrlCreateMenuItem("Treasures", $mEdit)
$miTradeData = GUICtrlCreateMenuItem("Trade Data", $mEdit)

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
            
        Case $miSpellDialog ; Note: this wasn't in the menu object but part of another gui, adding it to Edit if needed
            _OpenSpellEditorGUI($hMainGUI)
            
        Case $miOpenFile, $miOpenUsecode
            _GUICtrlStatusBar_SetText($hStatus, "Opening file...")
            
    EndSwitch
WEnD