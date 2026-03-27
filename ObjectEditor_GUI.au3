Func _OpenObjectEditorGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ObjectEditor_GUI.py"
    
    ConsoleWrite("> Launching Object Editor: " & $sScriptPath & @CRLF)
    
    ; Launch and wait
    ShellExecuteWait($sPythonPath, '"' & $sScriptPath & '"', @ScriptDir)
EndFunc
