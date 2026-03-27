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
;                               LAUNCH MODERNIZED UI
; ====================================================================================
Local $sPythonPath = "python"
Local $sMainScript = @ScriptDir & "\PY\Dransik ClassiK Editor.py"

ConsoleWrite("+ Transitioning to Python-based Modern UI Suite..." & @CRLF)
ShellExecuteWait($sPythonPath, '"' & $sMainScript & '"', @ScriptDir)

Exit