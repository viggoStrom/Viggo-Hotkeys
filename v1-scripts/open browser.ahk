Menu, Tray, Icon, C:\Program Files\Mozilla Firefox\firefox.exe ; Set the custom icon for the tray

#End::Reload

#c::
    Run, firefox.exe -new-window "https://web.skola24.se/timetable/timetable-viewer/it-gymnasiet.skola24.se/NTI`%20Uppsala/" -foregound
    WinWait, ahk_exe firefox.exe
    WinActivate,ahk_exe firefox.exe
return

