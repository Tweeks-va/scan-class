#!/bin/bash
## scan-class.sh

web=0
nc=0
firewall=0
ports=""
MYNUM=""

nmapoptions=' -Pn -T4 '


## Parse Options
# -w do web html head dump (reqd)
# -n network hostname-based netcatl listener scan (three digit number)
# -f firewall scan (hits ports 22 & 3389)
# -h help
while getopts 'wnfh' OPTION; do

	case "$OPTION" in
		w)
		#echo "Scanning for [-w]eb site..."
		export web=true
		;;
		
		n)
		#echo "Scanning for [-n]etcat-port# netcat binding..."
		export nc=true
		;;
		
		f)
		#echo "Scanning for [-f]irewall.."
		export firewall=true
		;;
		
		h)
		echo "Usage: $(basename $0) -w(reqd) [-n] [-f] host1 host2 ..."
		exit 1
		;;
	esac
done

if [ "$1" == "" ] ; then
	echo "ERROR: Must provide at least one IP or hostname to scan..."
	return 1
fi
echo



if [ $web == true ] ; then
	#echo web=true
	export ports="80"
fi

if [ $firewall == true ] ; then
	#echo firewall=true
	export ports="22,3389,$ports"
fi

if [ $nc == true ]; then
	#echo nc=true
	echo
fi



## PRE LOOP STATUS
echo "### PRE LOOP STATUS ###"
HOSTS=$(echo $@  | sed -e 's/\-[a-z]* //g')
echo HOSTS=$HOSTS
echo ports=$ports
#echo


for h in $HOSTS; do
	#echo ==HOSTS LOOP==
	##### WEB SITE SCAN (REQD) ####
	echo host=$h
	echo "## WEB SITE SCAN - $h"
	#echo "DO: lynx -dump $h | head -2"
	lynx -dump $h | head -2
	#lynx -dump $h | head -2

	##### NMAP SCAN ####
	MYNUM=""
	## For cutting the MYNUM out of the hostname $hed on hostname
	export MYNUM=$(echo $h | grep -o '[0-9][0-9][0-9]' 2>/dev/null)
	if [ $nc == true ] ; then
		echo "## NMAP PORT SCAN + MYNUM- $h"
		echo "nmap $nmapoptions -p $(echo $ports,$MYNUM|sed -e 's/,,/,/') --open $h"
		nmap $nmapoptions -p $(echo $ports,$MYNUM|sed -e 's/,,/,/') --open $h | grep -A3 '^PORT'| grep -v ^Nmap
	else
		echo "## NMAP PORT SCAN - $h"
		echo "nmap $nmapoptions -p $ports,1 --open $h"
		nmap $nmapoptions -p $ports,1 --open $h | grep -A4 '^PORT'|grep -v ^Nmap
	fi	
	echo;echo
done


