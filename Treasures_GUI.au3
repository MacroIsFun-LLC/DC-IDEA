Func _OpenTreasuresGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Treasures_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\treasure_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"chance": "15", "min": "50", "max": "500", "items": ["Gold Coins", "Silver Ring", "Healing Herb"]}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Treasures UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Treasure Data Saved", "The following Treasure data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
