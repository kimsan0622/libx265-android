cmake ../../../source \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_SYSTEM_VERSION=${ANDROID_API_VERSION} \
  -DCMAKE_ANDROID_ARCH_ABI=x86_64 \
  -DCMAKE_ANDROID_NDK=${NDK_ROOT} \
  -DCMAKE_ANDROID_STL_TYPE=gnustl_static

sed -i '' 's/-lpthread/-pthread/' CMakeFiles/cli.dir/link.txt
sed -i '' 's/-lpthread/-pthread/' CMakeFiles/x265-shared.dir/link.txt
sed -i '' 's/-lpthread/-pthread/' CMakeFiles/x265-static.dir/link.txt

make -j4
make DESTDIR=${OUTPUT_PREFIX}/x86_64 install