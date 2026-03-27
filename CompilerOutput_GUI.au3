Func _OpenCompilerOutputGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\CompilerOutput_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\compiler_cache.json"
    
    ; 1. Prepare Initial Data (Example log)
    Local $sLog = "> Initializing Map Compilation...\n> Parsing Static Objects...\n> Building Collision Grid...\n> SUCCESS: Build Complete (0.4s)"
    Local $sJson = '{"output": "' & $sLog & '"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Compiler Output UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
EndFunc
