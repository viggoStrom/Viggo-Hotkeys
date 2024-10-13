
# Move to the autostart folder
Set-Location "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# Remove the old AHK file
# Prompt the user for confirmation before deleting .ahk and .ahk2 files
$confirmation = Read-Host "Do you want to delete all .ahk and .ahk2 files in the directory? (Y/N)"
if ($confirmation -eq 'Y') {
    Remove-Item *.ahk, *.ahk2 -Force
    Write-Host "Files deleted."
} else {
    Write-Host "Deletion cancelled."
    
    Write-Host "Exiting script."
    exit
}

# Download all the seperate AHK files
Invoke-WebRequest -Uri <URI>
Invoke-WebRequest -Uri <URI>
Invoke-WebRequest -Uri <URI>
Invoke-WebRequest -Uri <URI>
Invoke-WebRequest -Uri <URI>

# Run all the AHK files
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>
Start-Process -FilePath "C:\Program Files\AutoHotkey\AutoHotkey.exe" -ArgumentList <fileName>