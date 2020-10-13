$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Output "libs: " + $scriptDir

$path = $scriptDir + "\react-native-pjsip-builder-2.8.0\release.ps1"
& $path

#Invoke-Item (powershell ($scriptDir + "\react-native-pjsip-builder-2.8.0\release.ps1"))



# Copy-Item -Force -Recurse dist/ios/VialerPJSIP.framework ../ios/
# Copy-Item -Force -Recurse dist/android/src/* ../android/src

