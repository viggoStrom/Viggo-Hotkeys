; # Tray Icon #
try {
    ; Set tray icon to a gear icon. Idk it's blue, kinda like the unicode logo
    Menu, Tray, Icon, %SystemRoot%\System32\shell32.dll, 318
}
catch {
    ; Backup icon
    ; Set tray icon to a file with an arrow. Maybe symbolizing the sending of a character?
    try Menu, Tray, Icon, %SystemRoot%\System32\imageres.dll, 279
}
; Tray text
Menu, Tray, Tip, AHK - Hotkeys to more easily type Unicode characters

; # Hotkeys #
#Space::
    Send, {U+00A0}
Return