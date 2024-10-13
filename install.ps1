
# Move to the autostart folder
Set-Location "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# Remove the old AHK file
# Prompt the user for confirmation before deleting .ahk and .ahk2 files
# Check if the folder contains .ahk or .ahk2 files
$ahkFiles = Get-ChildItem -Filter *.ahk
$ahk2Files = Get-ChildItem -Filter *.ahk2
if ($ahkFiles -or $ahk2Files) {
    $confirmation = Read-Host "The folder contains .ahk or .ahk2 files. Do you want to delete them? (Y/N)"
    if ($confirmation -eq 'Y') {
        Remove-Item *.ahk, *.ahk2 -Force
        Write-Host "Files deleted."
    } else {
        Write-Host "Deletion cancelled."
        Write-Host "Exiting script."
        exit
    }
}

# Download all the seperate AHK files
Invoke-WebRequest -Uri 
Invoke-WebRequest -Uri 
Invoke-WebRequest -Uri 
Invoke-WebRequest -Uri 
Invoke-WebRequest -Uri 

# Run all the AHK files
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>