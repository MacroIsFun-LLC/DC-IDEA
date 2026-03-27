Func _OpenNPCTypeGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NPCType_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\npc_type_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Goblins", "x": "32", "y": "32"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching NPC Type UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "New Species Registered", "The following NPC type data was initialized via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
