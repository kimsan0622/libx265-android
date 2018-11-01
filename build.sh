
mkdir x265/build/android
cp -rf build_script/* x265/build/android


#export NDK_ROOT="path/to/ndk-build" # you must export your ndk root. eg. usr/username/android-ndk-r16b. you can download ndk from this url:https://developer.android.com/ndk/downloads/
export ANDROID_API_VERSION=26 #chose android platform version. I recommend a version higher than 21.
export NUMBER_OF_CORES=4
export OUTPUT_PREFIX=$(pwd)/build

pushd x265/build/android/arm64-v8a
bash build.sh
popd

pushd x265/build/android/armeabi
bash build.sh
popd

pushd x265/build/android/armeabi-v7a
bash build.sh
popd

pushd x265/build/android/mips
bash build.sh
popd

pushd x265/build/android/mips64
bash build.sh
popd

pushd x265/build/android/x86
bash build.sh
popd

pushd x265/build/android/x86_64
bash build.sh
popd

