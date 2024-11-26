
# Save starting path to restore to later
$startingPath = Get-Location

$installPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

# Move to the startup folder
Set-Location $installPath

# Remove old AHK files in the install folder with user permission
$ahkFiles = Get-ChildItem -Filter *.ahk
$ahk2Files = Get-ChildItem -Filter *.ahk2
if ($ahkFiles -or $ahk2Files) {
    $confirmation = Read-Host "Your startup folder, $installPath contains .ahk and/or .ahk2 files. Do you want to delete them before installing the hotkeys? (Y/N) "

    if ($confirmation -eq 'Y' -or $confirmation -eq 'y' -or $confirmation -eq 'Yes' -or $confirmation -eq 'yes') {
        Remove-Item *.ahk, *.ahk2 -Force
        Write-Host "Files deleted."
    }
    else {
        Write-Host "Deletion cancelled."
        Write-Host "Exiting script."

        # Restore working directory
        Set-Location $startingPath
        exit
    }
}

$fileNames = @(
    "browser-navigation.ahk",
    "open-browser.ahk",
    "open-code.ahk",
    "query-selected.ahk",
    "send-unicode.ahk"
)

$downloadURL = "https://raw.githubusercontent.com/viggoStrom/Viggo-Hotkeys/refs/heads/main/v1-scripts/"

# Download all the separate AHK files
foreach ($fileName in $fileNames) {
    Invoke-WebRequest -Uri "$downloadURL$fileName" -OutFile "$fileName"
}

# Run all the AHK files 
foreach ($fileName in $fileNames) {
    Start-Process -FilePath "$fileName"
}

# Return to the starting path
Set-Location $startingPath

# Courtesy message post installation
Write-Host "Installation complete."$fileNames.Count"files installed in $env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
foreach ($fileName in $fileNames) {
    Write-Host " - $fileName"
}