#!/bin/sh

temp_mid=65
temp_high=80

usage_mid=40
usage_high=75

usage=$(nvidia-smi | grep 'Default' | awk '{print $13}' | sed 's/%//')

if [ "$usage" -ge "$usage_high" ] ; then
    echo -n "Gpu: <fc=#FF0000>$usage</fc>% "
elif [ "$usage" -ge "$usage_mid" ] ; then
    echo -n "Gpu: <fc=#FFFF00>$usage</fc>% "
else
    echo -n "Gpu: <fc=#ADD8E6>$usage</fc>% "
fi

temp=$(nvidia-smi | grep 'Default' | awk '{print $3}' | sed 's/C//')

if [ "$temp" -ge "$temp_high" ] ; then
    echo "<fc=#C1514E>$temp</fc>°C"
elif [ "$temp" -ge "$temp_mid" ] ; then
    echo "<fc=#C1A24E>$temp</fc>°C"
else
    echo "<fc=#AAC0F0>$temp</fc>°C"
fi
