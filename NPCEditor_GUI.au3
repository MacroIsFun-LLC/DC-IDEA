Func _OpenNPCEditorGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NPCEditor_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\npc_data.json"
    
    ; 1. Prepare Initial Data (Mocking current state)
    Local $sJson = '{"name": "New NPC", "alignment": "Neutral", "activity": "Wander", "shop_type": "None", "stats": {"Strength": "15", "Intelligence": "10", "Dexterity": "12", "Constitution": "14", "Health": "100", "Max Health": "100", "Level": "1", "Mana": "0", "Armorclass": "0"}}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching NPC Editor UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        ; In a full implementation, you'd parse this JSON and update your NPC Object
        MsgBox(64, "NPC Data Saved", "The following NPC data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
