#!/bin/bash

# Inspired by https://github.com/hrydgard/ppsspp-ffmpeg/blob/master/wiiu.sh

set -e

GENERAL="\
   --cross-prefix=powerpc-eabi- \
   --host=powerpc-linux"

function build_WUP
{
./configure  \
    --prefix=./build_WUP \
    ${GENERAL} \
    --enable-static \
    --disable-thread \
    --disable-cli \
    --disable-opencl \
    --extra-cflags="-Os -D__WIIU__  -fasm -Wno-psabi -fno-short-enums -fno-strict-aliasing -finline-limit=300 -mwup -mcpu=750 -meabi -mhard-float -U__INT32_TYPE__ -U__UINT32_TYPE__ -D__INT32_TYPE__=int" \
    --disable-asm

make clean
make -j8 install
}

build_WUP
echo WiiU build finished
   
 