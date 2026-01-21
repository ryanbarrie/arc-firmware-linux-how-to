## Prereqs

binwalk and bash are required

## Get firmware

Go to the intel site and download the latest. https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/arc/software/drivers.html

For Arc Pro: Look for "Latest Professional GPU Drivers".

For regular Arc: Look for "Latest Game On GPU Drivers".

This should take you to a download page where you can get gfx_win_versionnumber.exe

## Extract firmware

Extract the firmware using the included bash script.

    ./extract-firmware.sh /Path/To/gfx_win_version.exe

This should leave you with an acm and a bmg folder. If not, something went wrong with the extraction.

## Flash the firmware

Use the [igsc tool](/igsc.md) to flash the firmware, firmware data, oprom code, and oprom data in that order. Use the -a flag if you want to allow downgrading or flashing the same version of the firmware that's already installed.

Firmware

    ./igsc fw update --device /dev/mei<DeviceID> --image ~/path/to/fw.bin [-a]

Firmware data

    ./igsc fw-data update --device /dev/mei<DeviceID> --image ~/path/to/fwdata.bin [-a]

OPROM Code

    ./igsc oprom-code update --device /dev/mei<DeviceID> --image ~/path/to/opromcode.bin [-a]

OPROM Data

    ./igsc oprom-data update --device /dev/mei<DeviceID> --image ~/path/to/opromdata.bin [-a]

As an example for the Arc B50 Pro:

    ./igsc fw update --device /dev/mei0 --image ~/bmg/fwcode/bmg_g21_fwupdate.bin -a
    ./igsc fw-data update --device /dev/mei0 --image ~/bmg/fwdata/bmg_ibc-dws-b93_e212_config-data.bin -a
    ./igsc oprom-code update --device /dev/mei0 --image ~/bmg/opromcode/bmg_OpromCode.bin -a
    ./igsc oprom-data update --device /dev/mei0 --image ~/bmg/opromdata/bmg_e212_1114_config23.bin -a

## Notes

### Selecting the wrong firmware/data/oprom

This tool will not allow you to flash incompatible firmware, firmware data, oprom code, nor oprom data. I have tested this myself by trial-and-error.

### Viewing the current firmware/data/oprom version

To view the version on the card, run the following. Subtitute <TYPE> for fw, fw-data, oprom-code, or oprom-data.

    ./igsc <TYPE> version --device /dev/mei<DeviceID>

For example

    ./igsc fw version --device /dev/mei0
    Device: FW Version: BMG__21.1162

### Viewing the firmware/data/oprom version of a .bin/.rom file on disk

To view the version of a firmware/data/oprom file on disk, run the following. Substitute <TYPE> for fw, fw-data, oprom-code, or oprom-data.

    ./igsc <TYPE> version --image ~/path/to/file.bin

For example

    ./igsc fw version --image ~/bmg/fwcode/bmg_g21_fwupdate.bin
    Image:  FW Version: BMG__21.1162
