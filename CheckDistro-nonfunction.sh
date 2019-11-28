#!/usr/bin/env bash

# /etc/os-release is the newer standard w/ systemd, look for that first
if [ -f "/etc/os-release" ]
then
	DISTRO=$(cat /etc/os-release | head -n 1 | cut -d "=" -f 2 | tr '[:upper:]' '[:lower:]' | tr -d '\"')

# hostnamectl is still newer, but a nice fallback and exists on some systems not running systemd (ex: Ubuntu 14.04)
elif [ -x "$( command -v hostnamectl )" ]
then
	DISTRO=$(hostnamectl | grep "Operating System" | cut -d ":" -f 2 | sed -e 's/^[[:space:]]*//' | tr '[:upper:]' '[:lower:]')

fi
	if [[ ${DISTRO_CHECK} == *"arch"* ]]
	then
		DISTRO="arch"
	elif [[ ${DISTRO_CHECK} == *"manjaro"* ]]
	then
	    echo "manjaro"
	elif [[ ${DISTRO_CHECK} == *"centos"* ]]
	then
		DISTRO="centos"
	elif [[ ${DISTRO_CHECK} == *"fedora"* ]]
	then
		DISTRO="fedora"
	elif [[ ${DISTRO_CHECK} == *"rhel"* ]]
	then
	    DISTRO="rhel"
	elif [[ ${DISTRO_CHECK} == *"debian"* ]]
	then
		DISTRO="debian"
	elif [[ ${DISTRO_CHECK} == *"ubuntu"* ]]
	then
		DISTRO="ubuntu"
	elif [[ ${DISTRO_CHECK} == *"mint"* ]]
	then
        DISTRO="mint"
	fi

echo "${DISTRO}"
