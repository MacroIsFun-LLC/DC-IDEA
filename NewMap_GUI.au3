Func _OpenNewMapGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NewMap_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\new_map_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Wilderness Map", "x": "128", "y": "128"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching New Map UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Map Layout Generated", "The following map dimensions were registered:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
