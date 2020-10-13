$IMAGE_NAME="react-native-pjsip-builder/ios"
$CONTAINER_NAME="react-native-pjsip-builder-" + (Get-Random -Maximum 100)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $scriptDir

if (Test-Path "./dist/ios") {
    Remove-Item -Force -Recurse "./dist/ios"
}

docker build -t react-native-pjsip-builder/ios ./ios/;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

docker cp ${CONTAINER_NAME}:/dist/ios ./dist/ios

docker rm ${CONTAINER_NAME}
