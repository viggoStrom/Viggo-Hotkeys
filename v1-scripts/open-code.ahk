; # Tray Icon #
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

; # Find Path #
; Try the two common paths for VS Code:
;   C:\Users\{username}\AppData\Local\Programs\Microsoft VS Code\Code.exe
;   C:\Program Files\Microsoft VS Code\Code.exe
Func(FindIDEPath) {
    DriveLetter := SubStr(A_WinDir, 1, 2)
    AppDataLocal := DriveLetter . "\Users\" . A_UserName . "\AppData\Local"

    IDEPaths := []
    ; Appdata
    IDEPaths.Push(AppDataLocal . "\Programs\Microsoft VS Code\Code.exe")
    ; Program Files
    IDEPaths.Push(A_ProgramFiles . "\Microsoft VS Code\Code.exe")

    IDEPath := ""
    Loop, % IDEPaths.MaxIndex() {
        IDEPath := IDEPaths[A_Index]
        if FileExist(IDEPath) != ""
            break
    }

    if not FileExist(IDEPath) or IDEPath = "" {
        MsgBox, IDE not found
        ExitApp
    }

    return IDEPath
}

; # Get Path #
; Add launch arguments
IDEArgs := ""
IDEPath := Func(FindIDEPath) . IDEArgs
IDEEmptyWinTitle := "Visual Studio Code"

; # Hotkey #
#z::
    RunWait, %IDEPath%
    ; Wait for the IDE to open to maximize it
    WinActivate, %IDEEmptyWinTitle%
    WinMaximize, %IDEEmptyWinTitle%
    Return