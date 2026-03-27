Func _OpenEncounterTablesGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\EncounterTables_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\encounter_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"table_name": "Grassland Encounter", "rate": "15", "chance": "50", "detail": {"name": "Lone Wolf", "max_num": "3", "npcs": ["Gray Wolf", "Forest Wolf"]}}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Encounter Tables UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Encounter Data Saved", "The following Encounter data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
