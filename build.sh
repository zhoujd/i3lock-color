#!/bin/bash
autoreconf -fiv

if [[ -f /etc/arch-release ]]; then
    sed -i "s/^#auth include system-auth/auth include system-auth/g" pam/i3lock
    sed -i "s/^auth include login/#auth include login/g" pam/i3lock
fi

BUILD_DIR=build/
rm -rf $BUILD_DIR
mkdir -vp $BUILD_DIR
cd $BUILD_DIR || { echo "cd $BUILD_DIR"; exit 127; }

../configure --prefix=/usr --sysconfdir=/etc

make
