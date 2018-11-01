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
'''bash
    export NDK_ROOT=path/to/your/ndk/root/dir
'''
2. running build.sh
'''bash
    bash ./build.sh
'''
