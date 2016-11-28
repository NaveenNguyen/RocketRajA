#!/bin/bash

clear
echo
echo
echo "Welcome to roketRaja's Reconnaissance script"

break="=========================================================================="

echo $break

echo "Enter target IP/ domain name"
read target_domain

target_ip= dig +short $target_domain
sleep 3
echo
echo $target_ip

echo $break
sleep 2

echo "Choose your reconnaissance type"
echo "1.Active"
echo "2.Passive"
echo -n "Enter your choice (1 or 2): "

read choice

case $choice in
	1 )
	Active() 
		;;
	2 )
	Passive() 
		;;
esac

Active(){
	clear
	ping()
	sleep 2
	if [ $count -eq 0]
	then {
	echo "Target is not ACTIVE, can't recon now"
	echo "Try again later. !!!"
	exit	
	}

	else {
	#if target is active then go for further tools like nmap, etc., 
	echo "Target is Active"
	sleep 1
	echo
	echo "Starting Active reconnaissance"
	sleep 5
	echo
	echo
	echo "Starting fping"
	fping  $target_ip
	echo
	echo
	echo
	echo "Network and Port Scanning"
	nmap -v -A $target_domain
	sleep 30
	
	}
	fi
}

Passive(){
	clear
	echo " Starting Passive reconnaissance"
	echo
	echo
	echo "Open Source Intelligence using URLCRAZY"
	urlcrazy -k dvorak -r $target_domain 
	sleep 40
	echo
	echo
	echo
	echo "DNS Analysis"
	dnsenum --noreverse -w  google.com
	sleep 30	

}

ping(){
	count=$( ping -c 1 $target_domain | grep icmp* | wc -l )
}

#resources:
	#http://unix.stackexchange.com/questions/20784/how-can-i-resolve-a-hostname-to-an-ip-address-in-a-bash-script
	#http://www.yourownlinux.com/2013/10/bash-script-to-check-whether-a-host-is-up-or-down.html

	#http://www.thegeekstuff.com/2010/11/50-linux-commands/
