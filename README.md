# libx265-android
ndk compile version of libx265: You can download the origin source code from https://bitbucket.org/multicoreware/x265/ . Because the license of origin source code was GNU GPL v2.0, I set the license of this repository as GPL v2.0.

## support ABI

* arm64-v8a (neon)
* armeabi-v7a (neon)
* armeabi
* mips
* mips64
* x86
* x86_64

Latest Android Studio doesn't support MIPS architecture anymore. Therefore, I recommend that you use other architecture except for MIPS.

## how to build this?

1. set the NDK_ROOT variable.
```bash
    export NDK_ROOT=path/to/your/ndk/root/dir
```
2. change the build.sh file.
```bash
    export ANDROID_API_VERSION=26 # chose android platform version. I recommend a version higher than 21.
    export NUMBER_OF_CORES=4 # set the number of cores which you want to use for compile. it depends on CPU of your host computer.
    export OUTPUT_PREFIX=$(pwd)/build # set the output prefix. default directory is ./build
```
3. running build.sh
```shell
    bash ./build.sh
```
4. use the files in the build directory. each ABI folder has 3 kind of file.
    * include files - x265.h, x265_config.h (Of course, all include files are the same.)
    * library files - x265.so (shared lib), x265.a (static lib)
    * executable file - x265 (HEVC encoder program)

## little tip
if you want to use cli HEVC encoder program, I recommend that you use static library. If you just build it using that I uploaded, it will build the executable file with shared lib. But it's inconvinient, because you shoud add the shared library to library path. if you want to build executable file, you can just add simple flag **-DENABLE_SHARED=0** in each build scripts.

e.g.    build_script/arm64-v8a/build.sh
```bash
cmake ../../../source \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_SYSTEM_VERSION=${ANDROID_API_VERSION} \
  -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
  -DCMAKE_ANDROID_NDK=${NDK_ROOT} \
  -DCMAKE_ANDROID_STL_TYPE=gnustl_static \
  -DENABLE_SHARED=0 \ # add this line.
  -DNEON_ANDROID=1

sed -i '' 's/-lpthread/-pthread/' CMakeFiles/cli.dir/link.txt
sed -i '' 's/-lpthread/-pthread/' CMakeFiles/x265-shared.dir/link.txt
sed -i '' 's/-lpthread/-pthread/' CMakeFiles/x265-static.dir/link.txt

make -j${NUMBER_OF_CORES}

make DESTDIR=${OUTPUT_PREFIX}/arm64-v8a install
```
## test in android using adb

![Alt Text](https://github.com/kimsan0622/libx265-android/blob/master/screenshot/test.gif)

## x265 source code changes
commit log
* [cda6b5eac8f293b7f8264e98b722fd4fb252b072](https://github.com/kimsan0622/libx265-android/commit/cda6b5eac8f293b7f8264e98b722fd4fb252b072)

### contact
kimsan0622@khu.ac.kr
