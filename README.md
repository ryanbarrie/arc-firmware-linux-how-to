# Compile igsc

Detailed instructions at [igsc.md](/igsc.md)

## Quick version (Ubuntu)

    apt install libudev-dev build-essential cmake ninja-build
    git clone https://github.com/intel/igsc.git
    cd igsc/ && cmake -G Ninja -S . -B builddir && ninja -v -C builddir
    mkdir igsc-bin && cp builddir/src/igsc builddir/lib/libigsc.so* igsc-bin/ && tar zcvf igsc-bin.tar.gz igsc-bin

You now have a file igsc-bin.tar.gz with the binary and necessary libraries.

# Get the firmware

Detailed instructions at [firmware.md](/firmware.md)

## Quick version

Install binwalk and ensure it is in your PATH.

Go to the intel site and download the latest. https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/arc/software/drivers.html

For Arc: Look for "Latest Professional GPU Drivers".

For Non-Arc: Look for "Latest Game On GPU Drivers".

This should take you to a download page where you can get gfx_win_versionnumber.exe

Then extract it with the included bash script.

    ./extract-firmware.sh /Path/To/gfx_win_version.exe

# Flash the firmware

Detailed instructions at [firmware.md](/firmware.md)

## Quick version (Arc Pro B50)

Replace the image files with the ones for your card if it's not an Arc Pro B50. Replace mei0 with the device ID of your Arc card if you have multiple cards.

Place the firmware directory (bmg) in the home directory of the user that will be performing the upgrade.

Enter the directory with the igsc binary.

    ./igsc fw update --device /dev/mei0 --image ~/bmg/fwcode/bmg_g21_fwupdate.bin -a
    ./igsc fw-data update --device /dev/mei0 --image ~/bmg/fwdata/bmg_ibc-dws-b93_e212_config-data.bin -a
    ./igsc oprom-code update --device /dev/mei0 --image ~/bmg/opromcode/bmg_OpromCode.bin -a
    ./igsc oprom-data update --device /dev/mei0 --image ~/bmg/opromdata/bmg_e212_1114_config23.bin -a
