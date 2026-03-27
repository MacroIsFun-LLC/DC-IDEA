Func _OpenNewProjectGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\NewProject_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\new_project_data.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"template": "Standard RPG World"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching New Project UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Development Session Initialized", "The following project template was selected:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
