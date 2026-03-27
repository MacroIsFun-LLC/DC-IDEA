Func _OpenGenericDialogGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\GenericDialog_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\dialog_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"status": "init"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Generic Dialog UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Dialog Data Saved", "The following Generic Dialog data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
