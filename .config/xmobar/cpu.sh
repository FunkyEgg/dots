#!/bin/sh

temp_mid=75
temp_high=90

cores=$(lscpu | grep 'Core(s)' | awk '{print $4}')
avg=0

for core in $(seq 1 $cores)
do
    temp=$(sensors | grep -m 1 'temp'$core':'| awk '{print $2}' | sed 's/+//' | sed 's/\..*//')
    avg=$(($avg + $temp))
done
avg=$(($avg / $cores))

if [ "$avg" -ge "$temp_high" ] ; then
    echo "<fc=#C1514E>$avg</fc>°C"
elif [ "$avg" -ge "$temp_mid" ] ; then
    echo "<fc=#C1A24E>$avg</fc>°C"
else
    echo "<fc=#AAC0F0>$avg</fc>°C"
fi
