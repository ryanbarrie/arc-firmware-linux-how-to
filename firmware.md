## Get firmware

Go to the intel site and download the latest. https://www.intel.com/content/www/us/en/products/docs/discrete-gpus/arc/software/drivers.html

Look for "Latest Professional GPU Drivers". This should take you to a download page where you can get gfx_win_versionnumber.exe

## Extract firmware

Extract the firmware using the included bash script.

    ./extract-firmware.sh /Path/To/gfx_win_version.exe

This should leave you with an acm and a bmg folder. If not, something went wrong with the extraction.
