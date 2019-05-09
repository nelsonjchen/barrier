$ErrorActionPreference = "Stop"

New-Item -Force -ItemType Directory -Path ".\deps\"
$Wc = New-Object System.Net.WebClient
$Wc.DownloadFile('https://download.qt.io/official_releases/qt/5.12/5.12.3/qt-opensource-windows-x86-5.12.3.exe', 'deps\qt.exe') ;
Write-Output 'Downloaded QT Installer'
$Env:QT_INSTALL_DIR = Join-Path (Get-Location) "deps\Qt\Qt5.12.3"
Write-Output 'Starting QT Installer'
Start-Process deps\qt.exe -ArgumentList '--verbose --script azure-pipelines/qtifwsilent.qs' -NoNewWindow -Wait
Write-Output 'Installed QT Installer'
Remove-Item deps\qt.exe -Force
Remove-Item $Env:QT_INSTALL_DIR\MaintenanceTool.exe -Force
Write-Output 'Deleted Maintenance Tooling'

