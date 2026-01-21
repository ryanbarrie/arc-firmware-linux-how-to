## Get firmware

Go to the intel site and download the latest. https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/arc/software/drivers.html

Look for "Latest Professional GPU Drivers". This should take you to a download page where you can get gfx_win_versionnumber.exe

## Extract firmware

Extract the firmware using the included bash script.

    ./extract-firmware.sh /Path/To/gfx_win_version.exe

This should leave you with an acm and a bmg folder. If not, something went wrong with the extraction.

## Flash the firmware

Use the [igsc tool](/igsc.md) to flash the firmware, firmware data, oprom code, and oprom data in that order. Use the -a flag if you want to allow downgrading or flashing the same version of the firmware that's already installed.

As an example for the Arc B50 Pro:

    ./igsc fw update --device /dev/mei0 --image ~/bmg/fwcode/bmg_g21_fwupdate.bin -a
    ./igsc fw-data update --device /dev/mei0 --image ~/bmg/fwdata/bmg_ibc-dws-b93_e212_config-data.bin -a
    ./igsc oprom-code update --device /dev/mei0 --image ~/bmg/opromcode/bmg_OpromCode.bin -a
    ./igsc oprom-data update --device /dev/mei0 --image ~/bmg/opromdata/bmg_e212_1114_config23.bin -a
