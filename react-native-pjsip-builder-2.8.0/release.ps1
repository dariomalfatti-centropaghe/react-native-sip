$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Output "release: " + $scriptDir

Set-Location -Path $scriptDir

if (Test-Path "./dist") {
    Remove-Item -Force -Recurse "./dist"
}

mkdir -Path ./dist/;

& .\build_android.ps1

& .\build_ios.ps1
