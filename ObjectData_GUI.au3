Func _OpenObjectDataGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ObjectData_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\obj_data_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"id": "40292", "health": "100", "quality": "95", "secure": false, "blessed": true}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Object Data UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Object Data Saved", "The following Object data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
