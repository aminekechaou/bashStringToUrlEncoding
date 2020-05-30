#!/bin/bash

matchWord=$1
SCRIPTDIR=$(dirname "$0")

for (( i=0; i<"${#matchWord}"; i++ )); do
    matchCharRaw="$(echo ${matchWord:$i:1})"
    matchCharEscapedBackslash="${matchCharRaw//\\/\\\\}"
    matchCharFullyConverted="$(grep ^"$matchCharEscapedBackslash"[[:space:]] $SCRIPTDIR/urlConversionMac | cut -d' ' -f 2)"
    convertedWord+=$matchCharFullyConverted
done

echo $convertedWord

exit 0