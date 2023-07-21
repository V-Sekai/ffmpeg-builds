#!/bin/bash
source "$(dirname "$BASH_SOURCE")"/android-install-shared.sh
source "$(dirname "$BASH_SOURCE")"/defaults-lgpl-shared.sh

FF_CONFIGURE="./configure --arch=arm --target-os=android --enable-cross-compile \
--cross-prefix=$TOOLCHAIN/bin/$TARGET$API- \
--sysroot=$NDK/toolchains/llvm/prebuilt/linux-x86_64/sysroot"