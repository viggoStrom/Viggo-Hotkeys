; # Tray Icon #
try {
    ; Set tray icon to a magnifying glass with a tiny arrow
    Menu, Tray, Icon, %SystemRoot%\System32\imageres.dll, 272
    Menu, Tray, Tip, Open Browser Hotkey
}
catch {
    ; Backup icon
    ; Set tray icon to a magnifying glass
    try Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 210
}

; # Search Engine #
SearchEngine := "https://duckduckgo.com/?t=ffab&q="
; SearchEngine := "https://google.com/search?q="
; SearchEngine := "https://ecosia.org/search?q="
; SearchEngine := "https://bing.com/search?q="
; SearchEngine := "https://yahoo.com/search?q="

; # Find Browser Paths #
; Try some firefox paths and then some chrome paths.
; Move, remove, or add paths as needed.
Func(FindBrowserPath) {
    DriveLetter := SubStr(A_WinDir, 1, 2)
    AppDataLocal := DriveLetter . "\Users\" . A_UserName . "\AppData\Local"
    ProgramFilesX86 := A_ProgramFiles . " (x86)"

    BrowserPaths := []
    ; Firefox
    BrowserPaths.Push(A_ProgramFiles . "\Mozilla Firefox\firefox.exe")
    BrowserPaths.Push(ProgramFilesX86 . "\Mozilla Firefox\firefox.exe")
    BrowserPaths.Push(AppDataLocal . "\Mozilla Firefox\firefox.exe")
    ; Chrome
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

; # Define Path #  -new-tab 
BrowserPath := Func(FindBrowserPath) . " " . SearchEngine

; # Hotkey #
^q::
    ; Clear clipboard
    Clipboard := ""
    ; Copy selected text
    Send, ^c
    ; Wait for clipboard to update
    if ClipWait, 1 {
        MsgBox, Clipboard timed out
        Return ; Return on timeout
    }
    ; Format the clipboard
    clipboard := StrReplace(A_Clipboard, A_Space, "+")
    clipboard := StrReplace(clipboard, A_Tab, "+")
    
    BrowserPath := BrowserPath . Clipboard

    ; TODO, fix the focus issue
    WinActivate, ahk_exe %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
    RunWait, %BrowserPath%
    WinActivate, ahk_exe %BrowserPath%
return