Func _OpenAboutGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python" ; Assuming python is in PATH
    Local $sScriptPath = @ScriptDir & "\PY\About_GUI.py"
    
    ; Display status in console for debugging
    ConsoleWrite("> Launching Python UI: " & $sScriptPath & @CRLF)
    
    ; Launch and wait for the UI to close
    ShellExecuteWait($sPythonPath, '"' & $sScriptPath & '"', @ScriptDir)
EndFunc
