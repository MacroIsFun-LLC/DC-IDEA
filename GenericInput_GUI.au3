Func _OpenGenericInputGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\GenericInput_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\input_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"title": "Assign Sprite ID", "value": "20448"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Generic Input UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Input Received", "The following value was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
