Func _OpenChunktypeGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\Chunktype_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\chunk_type_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"current": {"newbie": true, "safe": false}, "default": {"newbie": false, "safe": true}}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Chunk Matrix UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
EndFunc
