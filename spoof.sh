# This program made by Fauzan 
#!/bin/bash
airmon-ng stop wlan0mon;
airmon-ng start wlan0;
clear;
echo "Your want choose :";
echo "1.Mac Address random";
echo "2.Mac Address Vendor";
echo "3.Mac Address input user";
read macadr;
if [[ $macadr == 1 ]]; then 
    ifconfig wlan0mon down;
    macchanger -r wlan0mon;
   
elif [[ $macadr == 2 ]]; then
    ifconfig wlan0mon down;
    macchanger -a wlan0mon;

elif [[ $macadr == 3 ]]; then
	echo "Enter Mac Address you want :";
	read macrand;
    ifconfig wlan0mon down;
    macchanger -m $macrand wlan0mon;
    
else
    echo "The input you entered is not correct";
    sleep 3;
    exit;
fi

clear;
echo "Your Mac Adress was spoofed, This is your mac address now :";
echo;
macchanger -p wlan0mon;
ifconfig wlan0mon up;
