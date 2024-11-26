; # Tray Icon #
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

; # Find Path #
; Try some firefox paths and then some chrome paths:
;  Firefox:
;   C:\Program Files\Mozilla Firefox\firefox.exe
;   C:\Program Files (x86)\Mozilla Firefox\firefox.exe
;   C:\User\{username}\AppData\Local\Mozilla Firefox\firefox.exe
;  Chrome:
;   C:\Program Files\Google\Chrome\Application\chrome.exe
;   C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
;   C:\User\{username}\AppData\Local\Google\Chrome\Application\chrome.exe
Func(FindBrowserPath) {
    DriveLetter := SubStr(A_WinDir, 1, 2)
    AppDataLocal := DriveLetter . "\Users\" . A_UserName . "\AppData\Local"
    ProgramFilesX86 := A_ProgramFiles . " (x86)"

    BrowserPaths := []
    ; Firefox paths
    BrowserPaths.Push(A_ProgramFiles . "\Mozilla Firefox\firefox.exe")
    BrowserPaths.Push(ProgramFilesX86 . "\Mozilla Firefox\firefox.exe")
    BrowserPaths.Push(AppDataLocal . "\Mozilla Firefox\firefox.exe")
    ; Chrome paths
    BrowserPaths.Push(A_ProgramFiles . "\Google\Chrome\Application\chrome.exe")
    BrowserPaths.Push(ProgramFilesX86 . "\Google\Chrome\Application\chrome.exe")
    BrowserPaths.Push(AppDataLocal . "\Google\Chrome\Application\chrome.exe")

    BrowserPath := ""
    Loop, % BrowserPaths.MaxIndex() {
        BrowserPath := BrowserPaths[A_Index]
        if FileExist(BrowserPath)
            break
    }

    if not FileExist(BrowserPath) or BrowserPath = "" {
        MsgBox, Browser not found
        ExitApp
    }

    return BrowserPath
}

; # Get Path #
; Add launch arguments
BrowserArgs := ""
BrowserPath := Func(FindBrowserPath) . BrowserArgs

; # Hotkey #
#c::
    Run, %BrowserPath%
    Return