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
	filein=`find /etc/sysconfig/iptables -cmin +60`

	if [[ ! -z "$filein" ]] && ([[ $(date +%H) -eq 05 ]] || [[ $(date +%H) -eq 17 ]])
	  then
	    echo "must save iptables"
	    service iptables save
	  else
	    echo "don't save iptables"
	fi
      else
	echo "Redhat 7"
    fi
fi


