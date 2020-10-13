const { spawn } = require('child_process');


async function main() {

    console.log("Execute release.js");
    const script = spawn('node ./react-native-pjsip-builder-2.8.0/release.js', { shell: true });

    for await (const data of script.stdout) {
        console.log(`${data}`);
    }

    const fs = require('fs-extra');

    console.log("Copy iOS stuff");
    fs.copySync(__dirname + '/react-native-pjsip-builder-2.8.0/dist/ios/VialerPJSIP.framework',  __dirname + '/ios/VialerPJSIP.framework/', { overwrite: true });

    console.log("Copy Android stuff");
    fs.copySync(__dirname + '/react-native-pjsip-builder-2.8.0/dist/android/src/', __dirname + '/android/src/', { overwrite: true });

}

main();