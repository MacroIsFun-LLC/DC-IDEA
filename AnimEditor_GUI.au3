Func _OpenAnimEditorGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\AnimEditor_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\anim_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Walk Cycle", "speed": "120", "frames": "8", "type": "Linear", "random": false}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Animation Editor: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Animation Sequence Saved", "The following Animation data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
