Func _OpenShapeGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Shape_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\shape_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Shape_001", "registry_count": 41}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Shape Dashboard: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
EndFunc
