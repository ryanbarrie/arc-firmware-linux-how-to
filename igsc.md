## Install prereqs

### Ubuntu

    apt install libudev-dev build-essential cmake ninja-build

### Other distros

Install:
* gcc
* cmake
* ninja-build
* libudev-devel
* git

## Clone igsc repo

    git clone https://github.com/intel/igsc.git

## Enter directory and compile

    cd igsc/
    cmake -G Ninja -S . -B builddir
    ninja -v -C builddir

## Create igsc package

    mkdir -p igsc-bin
    cp builddir/src/igsc builddir/lib/libigsc.so* igsc-bin/
    tar zcvf igsc-bin.tar.gz igsc-bin

## Run on target machine

Copy the resulting igsc-bin.tar.gz to the target machine, extract it with

    tar xf igsc-bin.tar.gz

Test it by entering the igsc-bin directory and running ./igsc --help

NOTE: You must enter the directory that the igsc binary is in before running it. This is so that the .so library it depends on can be found. There is almost certainly a cleaner way to do this, I can't be bothered.
