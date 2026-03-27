Func _OpenContainerGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Container_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\container_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"items": []}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Container UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
EndFunc
