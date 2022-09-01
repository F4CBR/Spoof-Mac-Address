#!/bin/bash
echo "Welcome to Spoof MAC Address Tools";
echo "Please select the menu you want :";
echo "1.eth0 (ethernet)";
echo "2.wlan0 (wifi)";
read choice;
if [[ $choice == 1 ]]; then
    clear;
    echo "Your want choose :";
    echo "1.Mac Address random";
    echo "2.Mac Address Vendor";
    echo "3.Mac Address input user";
    read macadr;
    if [[ $macadr == 1 ]]; then 
        ifconfig eth0 down;
        macchanger -r eth0;
        
    elif [[ $macadr == 2 ]]; then
        ifconfig eth0 down;
        macchanger -a eth0;
        
    elif [[ $macadr == 3 ]]; then
    	echo "Enter Mac Address you want :";
    	read macrand;
        ifconfig eth0 down;
        macchanger -m $macrand eth0;
        
    else
        echo "The input you entered is not correct";
        sleep 3;
        exit;
    fi
    
    clear;
    echo "Your Mac Adress was spoofed, This is your mac address now :";
    echo;
    ifconfig eth0 up;
    macchanger -s eth0;
   
elif [[ $choice == 2 ]]; then
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
    ifconfig wlan0mon up;
    macchanger -s wlan0mon;

else
    echo "The input you entered is not correct";
    sleep 3;
    exit;
fi
