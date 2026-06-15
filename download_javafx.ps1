$url = "https://download2.gluonhq.com/openjfx/21.0.2/openjfx-21.0.2_windows-x64_bin-sdk.zip"
$zipFile = "openjfx-sdk.zip"
$extractDir = "openjfx-sdk-temp"

Write-Host "Downloading JavaFX SDK..."
Invoke-WebRequest -Uri $url -OutFile $zipFile

Write-Host "Extracting JavaFX SDK..."
Expand-Archive -Path $zipFile -DestinationPath $extractDir

Write-Host "Copying native libraries (DLLs) to lib/..."
if (!(Test-Path "lib")) {
    New-Item -ItemType Directory -Path "lib"
}
Copy-Item -Path "$extractDir\javafx-sdk-21.0.2\bin\*.dll" -Destination "lib" -Force

Write-Host "Cleaning up..."
Remove-Item -Path $zipFile -Force
Remove-Item -Path $extractDir -Recurse -Force

Write-Host "JavaFX native DLL libraries have been successfully set up in the lib directory!"
