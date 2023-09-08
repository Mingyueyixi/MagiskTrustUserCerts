#!/bin/bash

mkdir "build"
outputName=AlwaysTrustUserCertsX.zip
outputPath=build/$outputName
rm -f outputPath
zip -r $outputPath ./* -x './.git/**' -x './README.md' -x './build.sh' -x './build/*' './idea*'

function pushToSdcard() {
  for mobile in $(adb devices | tail -n +2 | cut -sf 1); do
    adb -s "$mobile" push "$1" "$2"
  done
}

pushToSdcard $outputPath sdcard/$outputName