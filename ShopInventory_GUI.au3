Func _OpenShopInventoryGUI($hParent)
    ; Modernized Python UI Call with Data Bridge
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ShopInventory_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\shop_inv_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"merchant": "The General Store", "stock": [{"name": "Short Sword", "qty": 10}, {"name": "Lesser Potion", "qty": 25}]}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Shop Inventory UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Inventory Updated", "The following stock data was synchronized from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
