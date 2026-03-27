Func _OpenArmorDataGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ArmorData_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\armor_data.json"
    
    ; 1. Prepare Initial Data (Mocking current state)
    Local $sJson = '{"type": "Chest", "align": "Neutral", "protection": "10", "min_hp": "100", "max_hp": "200", "repairable": true, "magic": false, "reqs": {"Min Level": "1", "Min Str": "5", "Min Int": "5", "Min Dex": "5", "Min Con": "5"}}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Armor Data UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        ; In a full implementation, you'd parse this JSON and update your engine
        MsgBox(64, "Armor Data Saved", "The following data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
