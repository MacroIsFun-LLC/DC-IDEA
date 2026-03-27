Func _OpenSpriteEditorGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\SpriteEditor_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\sprite_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "New Anim Sprite", "frames": 8}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Sprite Editor: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Sprite Data Saved", "The following Sprite data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
