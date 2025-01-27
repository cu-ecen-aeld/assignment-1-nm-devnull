#!/bin/bash

set -euo pipefail

writefile=$1
writestr=$2

if [ $# -lt 1 ]
then
    echo "ERROR: argument count"
    exit 1
fi

filename=$(basename -- "$writefile")
dirpath=$(dirname -- "$writefile")

if [ ! -d "$dirpath" ]
then
    mkdir -p $dirpath
fi

cd $dirpath
touch $filename

if [ ! -f "$filename" ]
then
    echo "file create unsuccessful"
    exit 1
else
    echo "$writestr" > $filename
fi

echo 0
