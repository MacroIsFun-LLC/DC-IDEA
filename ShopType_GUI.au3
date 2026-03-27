Func _OpenShopTypeGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ShopType_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\shop_type_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"type": "General Store", "can_buy": true}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Shop Type UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Merchant Profile Updated", "The following shop type data was modernized via the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
