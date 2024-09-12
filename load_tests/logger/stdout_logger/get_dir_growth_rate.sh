#!/bin/bash

# This script returns the growth rate of a directory.

monitored_dir="$1"

kb_start=$(du -sk "$monitored_dir" | cut -f 1)
ms_start=$(date +%s%N | cut -b1-13)
echo "$ms_start: $kb_start"

sleep 120

kb_end=$(du -sk "$monitored_dir" | cut -f 1)
ms_end=$(date +%s%N | cut -b1-13)
echo "$ms_end: $kb_end"

tput=$(echo "scale=2; ($kb_end - $kb_start) / ($ms_end - $ms_start)" | bc)
echo "MB/s: $tput"
