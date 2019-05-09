$ErrorActionPreference = "Stop"

New-Item -Force -ItemType Directory -Path ".\deps\"
$Wc = New-Object System.Net.WebClient
$Wc.DownloadFile('https://github.com/nelsonjchen/mDNSResponder/releases/download/v2019.05.08.1/x64_RelWithDebInfo.zip', 'deps\BonjourSDKLike.zip') ; 
Write-Output 'Downloaded BonjourSDKLike Installer' 
Write-Output 'Starting BonjourSDKLike Installer' 
Remove-Item -Recurse -Force .\deps\BonjourSDKLike
Expand-Archive .\deps\BonjourSDKLike.zip -DestinationPath .\deps\BonjourSDKLike
Write-Output 'Installed BonjourSDKLike Installer' 
Remove-Item deps\BonjourSDKLike.zip
Write-Output 'Deleted BonjourSDKLike Installer' 
