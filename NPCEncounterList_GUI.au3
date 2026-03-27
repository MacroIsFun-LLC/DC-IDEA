Func _OpenNPCEncounterListGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NPCEncounterList_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\npc_enc_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Orc Grunt"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching NPC Encounter List UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Encounter Asset Linked", "The following NPC was selected for the encounter table:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
