Func _OpenSignDataGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\SignData_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\sign_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"text": "Beware of the Goblins in the hills!"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Sign Data UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Signage Engraved", "The following sign text was updated via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
