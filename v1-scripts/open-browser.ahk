try {
    ; Set tray icon to a globe
    Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 14
    Menu, Tray, Tip, Open Browser Hotkey
}
catch {
    ; Backup icon
    ; Set tray icon to internet explorer
    try Menu, Tray, Icon, %ProgramFiles%\Internet Explorer\iexplore.exe
}

BrowserPath := A_ProgramFiles . "\Mozilla Firefox\firefox.exe"

#c::
    Run, %BrowserPath%