Func _OpenTradeDataGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\TradeData_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\trade_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"source": "Iron Ingot", "qty": "2", "skill": "15", "difficulty": "10"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Trade Data UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Trade Data Saved", "The following Trade data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
