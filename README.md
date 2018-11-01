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
2. running build.sh
```shell
    bash ./build.sh
```
3. use the files in the build directory. each ABI folder has 3 kind of file.
    * include files - x265.h, x265_config.h (Of course, all include files are the same.)
    * library files - x265.so (shared lib), x265.a (static lib)
    * executable file - x265 (HEVC encoder program)

## x265 source code changes
commit log
cda6b5eac8f293b7f8264e98b722fd4fb252b072

### contact
kimsan0622@khu.ac.kr
