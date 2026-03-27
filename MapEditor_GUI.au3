Func _OpenMapEditorGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\MapEditor_GUI.py"
    
    ConsoleWrite("> Launching Map Editor UI: " & $sScriptPath & @CRLF)
    
    ; Launch and wait
    ShellExecuteWait($sPythonPath, '"' & $sScriptPath & '"', @ScriptDir)
EndFunc
