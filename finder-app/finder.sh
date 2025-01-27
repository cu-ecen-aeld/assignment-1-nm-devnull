#!/bin/bash

set -euo pipefail

filedir=$1
searchstr=$2

filecount=$(find $filedir -type f | wc -l)
matchcount=$(find $filedir -type f -exec grep -r $searchstr {} \; | wc -l)

if [  $# -lt 1 ]
then
    echo "ERROR: arguement count"
    exit 1
fi

if [ ! -d "$filedir" ]
then
    echo "ERROR: directory does not exist"
    exit 1
fi

echo "The number of files are ${filecount} and the number of matching lines are
${matchcount}"

exit 0
