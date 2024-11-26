try {
    ; Set tray icon to a back arrow
    Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 298
}
catch {
    ; Backup icon
    ; Set tray icon to a set of two arrows
    try Menu, Tray, Icon, %SystemRoot%\System32\Dxpserver.exe
}
; Tray text
Menu, Tray, Tip, AHK - F3 and F4 do browser back and forward navigation

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