Func _OpenSelectMapGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\SelectMap_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\select_map_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Newbie Island", "action": "open"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Select Map UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        ; Check for 'new' action
        If StringInStr($sResult, '"action": "new"') Then
            Return _OpenNewMapGUI($hParent)
        EndIf
        MsgBox(64, "Map Environment Loaded", "The following map was selected for editing:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
