#!/bin/bash
autoreconf -fiv

if 
    sed -i "/^auth include system-auth/c\#auth include system-auth" pam/i3lock
    sed -i "/^#auth include login/c\auth include login" pam/i3lock
fi

BUILD_DIR=build/
rm -rf $BUILD_DIR
mkdir -vp $BUILD_DIR
cd $BUILD_DIR || { echo "cd $BUILD_DIR"; exit 127; }

../configure --prefix=/usr --sysconfdir=/etc

make
