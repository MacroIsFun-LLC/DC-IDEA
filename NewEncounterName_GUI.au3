Func _OpenNewEncounterNameGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NewEncounterName_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\new_enc_name_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Wilderness Spawns"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching New Encounter Name UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Profile Created", "The following encounter profile name was registered via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
