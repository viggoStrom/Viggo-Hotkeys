
# Save starting path
$startingPath = Get-Location

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
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v2-scripts/browser-navigation.ahk2" -OutFile "browser-navigation.ahk2"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v2-scripts/open-browser.ahk2" -OutFile "open-browser.ahk2"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v2-scripts/open-code.ahk2" -OutFile "open-code.ahk2"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v2-scripts/query-selected.ahk2" -OutFile "query-selected.ahk2"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v2-scripts/send-unicode.ahk2" -OutFile "send-unicode.ahk2"

# Run all the AHK files 
Start-Process -FilePath "browser-navigation.ahk2"
Start-Process -FilePath "open-browser.ahk2"
Start-Process -FilePath "open-code.ahk2"
Start-Process -FilePath "query-selected.ahk2"
Start-Process -FilePath "send-unicode.ahk2"

# Return to the starting path
Set-Location $startingPath

# Remove the install script
Remove-Item ($startingPath + install.ps1) -Force