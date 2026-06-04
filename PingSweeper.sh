#!/bin/bash

#program to find host discovery at local network
echo "-----------------------------------"
echo "NETWORK : 192.168.1.0/24"
echo "Host discovery scanning......"

> up_devices.txt

for i in 192.168.1.{1..254}
do
(
    if ping -c 1 -w 1 "$i" &> /dev/null

    then
echo "IP: $i is alive." | tee -a up_devices.txt
    fi
)&
done
wait

echo "Scan completed."	| tee -a up_devices.txt
echo "Results saved in up_devices.txt" | tee -a up_devices.txt 
echo "Last Scan: `date`" | tee -a up_devices.txt

echo "-----------------------------------"
