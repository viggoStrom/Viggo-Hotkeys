Menu, Tray, Icon, C:\Windows\System32\shell32.dll, 90 ; Set the custom icon for the tray

#End::Reload

IfWinActive, Mozilla Firefox
{
    F3::SendInput, {Browser_Back}
    F4::SendInput, {Browser_Forward}
}