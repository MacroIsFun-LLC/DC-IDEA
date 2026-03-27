Func _OpenObjectPropertiesGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ObjectProperties_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\obj_props_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"properties": "type: dynamic\ndestructible: true\nrespawn_timer: 300"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Object Properties UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Metadata Synchronized", "The following object template properties were updated via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
