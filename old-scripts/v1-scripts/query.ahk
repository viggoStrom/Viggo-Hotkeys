Menu, Tray, Icon, C:\Windows\System32\shell32.dll, 23 ; Set the custom icon for the tray

#End::Reload

^q::
    Clipboard := ""
    SendInput, ^c
    ClipWait
    Clipboard := StrReplace(Clipboard," ", "+")
    URL := "https://duckduckgo.com/?t=ffab&q=" . Clipboard
    Run, firefox.exe %URL%
    WinActivate, firefox.exe
Return

