; # Tray Icon #
try {
    ; Set tray icon to a magnifying glass with a tiny arrow
    Menu, Tray, Icon, %SystemRoot%\System32\imageres.dll, 272
}
catch {
    ; Backup icon
    ; Set tray icon to a magnifying glass
    try Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 210
}
; Tray text
Menu, Tray, Tip, AHK - Search for the selected text

; # Search Engine #
SearchEngine := "https://duckduckgo.com/?t=ffab&q="
; SearchEngine := "https://google.com/search?q="
; SearchEngine := "https://ecosia.org/search?q=" ; Syntax may not work
; SearchEngine := "https://bing.com/search?q=" ; Syntax may not work
; SearchEngine := "https://yahoo.com/search?q=" ; Syntax may not work

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

; # Define Path
BrowserPath := Func(FindBrowserPath) . " " . SearchEngine

; # Hotkey #
^q::
    ; Clear clipboard
    A_Clipboard := ""

    ; Copy selected text
    Send, ^c

    ; Wait for clipboard to update
    ClipWait

    ; Format the clipboard
    ClipValue := A_Clipboard
    ClipValue := StrReplace(ClipValue, A_Space, "+")
    ClipValue := StrReplace(ClipValue, A_Tab, "+")
    
    ; Combine the clipboard with the search engine URI
    SearchPath := BrowserPath . ClipValue

    RunWait, %SearchPath%

    ; When the browser is already in focus it loses focus on the tab. 
    ; This is just a workaround to bring the browser back to focus.
    Click, 960, 540
return