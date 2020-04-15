echo "+++ Remove old apks +++"
rm ./app-release.apks

echo "+++ Build apks from aab +++"
bundletool build-apks --bundle=./app-release.aab --output=./app-release.apks

echo "Install apk on device"
bundletool install-apks --apks=./app-release.apks --device-id=$ANDROID_DEVICE_ID