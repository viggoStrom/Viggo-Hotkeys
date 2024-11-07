try {
    ; Set tray icon to a back arrow
    Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 298
    Menu, Tray, Tip, Forward and Back Hotkeys for Browser
}
catch {
    ; Backup icon
    ; Set tray icon to a set of two arrows
    try Menu, Tray, Icon, %SystemRoot%\System32\Dxpserver.exe
}

F3::
    ; If the Alt key is pressed, don't do anything
    if GetKeyState, "Alt", "P"{
        return
    }
    Send, {Browser_Back}

F4::
    ; If the Alt key is pressed, don't do anything
    if GetKeyState, "Alt", "P"{
        return
    }
    Send, {Browser_Forward}