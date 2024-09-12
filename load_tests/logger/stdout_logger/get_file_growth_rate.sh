#!/bin/bash

# This script returns the growth rate of a file.

monitored_file="$(readlink -f "$1")"

bytes_start=$(ls -l "$monitored_file" | cut -d ' ' -f 5)
ms_start=$(date +%s%N | cut -b1-13)
echo "$ms_start: $bytes_start"

sleep 1

bytes_end=$(ls -l "$monitored_file" | cut -d ' ' -f 5)
ms_end=$(date +%s%N | cut -b1-13)
echo "$ms_end: $bytes_end"

tput=$(echo "scale=2; ($bytes_end - $bytes_start) / ($ms_end - $ms_start) / 1000" | bc)
echo "MB/s: $tput"
