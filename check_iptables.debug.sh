#!/bin/bash

file="/etc/sysconfig/iptables"
ver=`grep " 6" /etc/redhat-release`
echo $ver

if [ ! -f "$file" ]
  then
    echo "$0: File '${file}' not found."
  else 
    if [[ $ver =~ [6] ]] 
      then
	echo "Redhat 6"
	echo "Saving current running iptables only if "
	filein=`find /etc/sysconfig/iptables -cmin +60`

echo "filein ====="$filein"=="
hour=$(date +%H)
echo "hour now is:"$hour
if [ $(date +%H) -eq 05 ]
then 
echo "time 05"
fi
if [ $(date +%H) -eq 17 ]
then
echo "time 07"
fi

	if [[ ! -z "$filein" ]] && ([[ $(date +%H) -eq 05 ]] || [[ $(date +%H) -eq 17 ]])
	  then
	    echo "must save iptables"
#	    service iptables save
	  else
	    echo "don't save iptables"
	fi
      else
	echo "Redhat 7"
    fi
fi


