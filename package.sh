#!/bin/bash

# Move files to the build locations
mkdir build
cp -v CMakeLists.txt build
cp -v rootfs.tar.bz2 build
cp -v manifest.json.in build
cp -v app.desktop.in build
cp -v app.apparmor build
cp -v -r assets build
cp -v -r plugins build
cp -v -r po build
cp -v -r qml build
cp -v -r scripts build

# build
cd build
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
click build build --no-validate

# clean up
rm -r -v build
