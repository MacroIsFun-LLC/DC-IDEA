Func _OpenNPCDialogGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NPCDialog_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\npc_dialog_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Grizzled Merchant", "alignment": "Neutral", "activity": "Shopkeep", "shop": "General", "hp": "100", "maxhp": "100", "mana": "20", "level": "5", "armorclass": "10", "strength": "12", "intelligence": "10", "dexterity": "8", "constitution": "11"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching NPC Dialog UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "NPC Personality Engraved", "The following NPC data was synchronized via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
