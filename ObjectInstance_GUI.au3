Func _OpenObjectInstanceGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ObjectInstance_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\obj_inst_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"type": "Ancient Crate", "map": "Wilderness_003", "hp": "1000", "props": "{\n  \"interactable\": true,\n  \"loot_table\": \"mid_tier\"\n}"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Object Instance UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Instance State Saved", "The following instance property overrides were registered via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
