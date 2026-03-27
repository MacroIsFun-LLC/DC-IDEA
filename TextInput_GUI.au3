Func _OpenTextInputGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\TextInput_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\text_input_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"text": "Sample Text: Welcome to Dransik!"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Text Input UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Text Updated", "The following finalized text was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
