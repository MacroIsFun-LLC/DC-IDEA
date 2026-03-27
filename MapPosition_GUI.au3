Func _OpenMapPositionGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\MapPosition_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\map_pos_cache.json"
    
    ; 1. Prepare Initial Data (Example coords)
    Local $sJson = '{"x": "1248", "y": "2592"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Map Position UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
EndFunc
