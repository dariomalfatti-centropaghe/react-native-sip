Write-Output "Start creating Android container"

$IMAGE_NAME="react-native-pjsip-builder/android"
$CONTAINER_NAME="react-native-pjsip-builder-" + (Get-Random -Maximum 100)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $scriptDir

if (Test-Path "./dist/android") {
    Remove-Item -Force -Recurse "./dist/android"
}

mkdir -Path ./android/;

Set-Location -Path $scriptDir/android

docker build -t react-native-pjsip-builder/android ./;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

Set-Location -Path ..

docker cp ${CONTAINER_NAME}:/dist/android ./dist/android

docker rm ${CONTAINER_NAME}
