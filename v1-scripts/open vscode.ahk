Menu, Tray, Icon, C:\Users\viggo\AppData\Local\Programs\Microsoft VS Code\Code.exe ; Set the custom icon for the tray

#End::Reload

#z::
    Run, "C:\Users\viggo\AppData\Local\Programs\Microsoft VS Code\Code.exe" --new-window
    WinWait, Visual Studio Code
    WinActivate, Visual Studio Code
    WinMaximize, Visual Studio Code
Return

