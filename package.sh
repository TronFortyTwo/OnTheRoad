#!/bin/bash

# Move files to the build locations
mkdir buildir
cp -v CMakeLists.txt buildir
cp -v rootfs.tar.bz2 buildir
cp -v manifest.json.in buildir
cp -v app.desktop.in buildir
cp -v app.apparmor buildir
cp -v -r assets buildir
cp -v -r plugins buildir
cp -v -r po buildir
cp -v -r qml buildir
cp -v -r scripts buildir

# build
cd buildir
cmake .
make -j4

# install plugin
cd qml
mkdir Template
cp -v -r ../plugins/Template/qmldir Template
cp -v -r ../plugins/Template/Template/libTemplate.so Template
cd ..

# clean up
rm -r -v plugins
rm -r -v CMakeFiles
rm -v CMakeLists.txt
rm -v cmake_install.cmake
rm -v CMakeCache.txt
rm -v Makefile
rm -v app.desktop.in
rm -v manifest.json.in

# packaging
cd ..
click build buildir --no-validate

# clean up
rm -r -v buildir
