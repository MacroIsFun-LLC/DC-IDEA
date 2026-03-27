Func _OpenEncounterTableGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\EncounterTable_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\enc_table_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Wilderness Orcs", "rate": "100", "chance": "5", "encounters": ["Orc Grunt", "Orc Scout"]}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Encounter Table UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Table Configured", "The following encounter table was updated via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
