Func _OpenFactionsGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Factions_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\faction_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Shadow Guard", "abrev": "SHG"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Faction Editor: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Faction Data Saved", "The following Faction data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
