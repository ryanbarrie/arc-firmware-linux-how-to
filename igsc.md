## Install prereqs

### Ubuntu

    apt install libudev-dev build-essential cmake ninja-build

### Other distros

Install gcc, cmake, ninja-build, libudev-devel

## Clone igsc repo

    git clone https://github.com/intel/igsc.git

## Enter directory and compile

    cd igsc/
    cmake -G Ninja -S . -B builddir
    ninja -v -C builddir

## Create igsg package

    mkdir igsc-bin
    cp builddir/src/igsc builddir/lib/libigsc.so* igsc-bin/
    tar zcvf igsc-bin.tar.gz igsc-bin

## Run on target machine

Copy the resulting igsc-bin.tar.gz to the target machine, extract it with

    tar xf igsc-bin.tar.gz

Test it by entering the igsc-bin directory and running ./igsc --help
