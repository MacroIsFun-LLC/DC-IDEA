Func _OpenShopItemsGUI($hParent)
    ; Modernized Python UI Call
    Local $sPythonPath = "python"
    Local $sScriptPath = @ScriptDir & "\PY\ShopItems_GUI.py"
    Local $sDataPath = @ScriptDir & "\PY\shop_items_cache.json"
    
    ; 1. Prepare Initial Data
    Local $sJson = '{"selected": "Short Sword"}'
    FileDelete($sDataPath)
    FileWrite($sDataPath, $sJson)
    
    ConsoleWrite("> Launching Shop Items UI: " & $sScriptPath & @CRLF)
    
    ; 2. Launch and Wait
    Local $iPID = RunWait($sPythonPath & ' "' & $sScriptPath & '" "' & $sDataPath & '"', @ScriptDir)
    
    ; 3. Read back results
    If FileExists($sDataPath) Then
        Local $sResult = FileRead($sDataPath)
        ConsoleWrite("+ Data Received: " & $sResult & @CRLF)
        MsgBox(64, "Item Registry Synchronized", "The following item selection was received from the Python UI:" & @CRLF & @CRLF & $sResult)
    EndIf
EndFunc
