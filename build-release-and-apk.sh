echo "+++ Starting build script +++"
echo "+++ Remove old aab and apks +++"
rm ./app-release.apks ./app-release.aab

echo "+++ Build aab +++"
flutter build appbundle
mv ./build/app/outputs/bundle/release/app-release.aab ./app-release.aab

echo "+++ Build script finished successfully! +++"
