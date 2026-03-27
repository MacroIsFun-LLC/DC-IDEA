Func _OpenRaceGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Race_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\race_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Human", "min": "5", "max": "25"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Racial Alignment UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Racial Traits Synchronized", "The following racial constraints were received via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
