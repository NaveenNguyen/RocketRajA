#!/bin/bash

clear
echo
echo
echo "Welcome to roketRaja's Reconnaissance script"

break = "=========================================================================="

$break
echo"Choose your reconnaissance type"
echo "1.Active"
echo "2.Passive"
echo -n "Enter your choice (1 or 2): "

read choice

case $choice in
	1)
	clear
	Active()

	2)
	clear
	passive()
