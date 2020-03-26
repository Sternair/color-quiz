flutter build appbundle

rm ./app-release.apks

bundletool build-apks --bundle=./build/app/outputs/bundle/release/app-release.aab --output=./app-release.apks


