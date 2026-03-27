Func _OpenEncounterNameGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\EncounterName_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\enc_name_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Forest Predators", "action": "open"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Encounter Registry UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        ; Check for 'new' action
        If StringInStr($sResult, '"action": "new"') Then
            Return _OpenNewEncounterNameGUI($hParent)
        EndIf
        MsgBox(64, "Registry Selection Confirmed", "The following encounter profile was loaded for editing:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
