#!/bin/bash

which binwalk >/dev/null 2>/dev/null

if [[ $? -ne 0 ]]; then
  echo "binwalk not found in PATH"
  echo $PATH
  exit -2
fi

if [[ $# -ne 1 ]]; then
  echo Must contain 1 argument, a path to the .exe
  exit -1
fi

MY_FILE=$1
MY_FILE_BN=`basename "$1"`

binwalk -y rar --dd='rar:rar:unrar x %e' "${MY_FILE}" >/dev/null
cp -r _${MY_FILE_BN}.extracted/Graphics/ifwi/{bmg,acm} .

echo "About to delete _${MY_FILE_BN}.extracted, sleeping 5s first"

sleep 5

rm -r --one-file-system _${MY_FILE_BN}.extracted


