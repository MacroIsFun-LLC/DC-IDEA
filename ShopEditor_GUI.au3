Func _OpenShopEditorGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ShopEditor_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\shop_data.json"
    
    ; 1. Prepare Initial Data (Mocking current state)
    Local $sJson = '{"merchant_name": "New Shopkeeper", "inventory": [{"name": "Short Sword", "qty": "5"}, {"name": "Healing Potion", "qty": "10"}]}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Shop Editor UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        ; In a full implementation, you'd parse this JSON and update your Shop Object
        MsgBox(64, "Shop Data Saved", "The following Shop data was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
