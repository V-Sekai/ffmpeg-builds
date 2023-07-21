#!/bin/bash

export ANDROID_SDK_ROOT="/usr/local/lib/android/sdk"
export ANDROID_NDK_VERSION="23.2.8568313"
export TOOLCHAIN="${ANDROID_SDK_ROOT}/ndk/${ANDROID_NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64"
export TARGET="aarch64-linux-androideabi"
export API="21"

export AR="$TOOLCHAIN/bin/$TARGET-ar"
export AS="$TOOLCHAIN/bin/$TARGET-as"
export CC="$TOOLCHAIN/bin/$TARGET$API-clang"
export CXX="$TOOLCHAIN/bin/$TARGET$API-clang++"
export LD="$TOOLCHAIN/bin/$TARGET-ld"
export RANLIB="$TOOLCHAIN/bin/$TARGET-ranlib"
export STRIP="$TOOLCHAIN/bin/$TARGET-strip"

package_variant() {
    IN="$1"
    OUT="$2"

    mkdir -p "$OUT"/bin
    cp "$IN"/bin/* "$OUT"/bin

    mkdir -p "$OUT"/lib
    cp -a "$IN"/lib/*.so* "$OUT"/lib

    mkdir -p "$OUT"/include
    cp -r "$IN"/include/* "$OUT"/include
}

test_build() {
    echo 'int main() { return 0; }' > test.c
    $CC -o test test.c
    if [ $? -eq 0 ]; then
        echo "Compilation successful."
    else
        echo "Compilation failed."
    fi
    rm test.c test
}

ls /usr/local/lib/android/sdk/ndk/23.2.8568313/toolchains/llvm/prebuilt/linux-x86_64/bin/

test_build
