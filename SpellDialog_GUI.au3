Func _OpenSpellEditorGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\SpellDialog_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\spell_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"name": "Fireball", "mana": "20", "target": "Area of Effect", "area": "3", "level": "4", "scaling": "0.5", "requirement": "40"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Spell Dialog UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Spell Configuration Saved", "The following Spell data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
