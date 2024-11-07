try {
    ; Set tray icon to cmd
    Menu, Tray, Icon, %SystemRoot%\System32\cmd.exe
    Menu, Tray, Tip, Open Code Hotkey
}
catch {
    ; Backup icon
    ; Set tray icon to powershell
    try Menu, Tray, Icon, %SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe
}

; Try the two most common paths for VS Code
IDEPath := StrReplace(A_WinDir, "\windows") . "\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"
try FileExist(IDEPath)
catch {
    IDEPath := A_ProgramFiles . "\Microsoft VS Code\Code.exe"
}

#z::
    Run, %IDEPath%