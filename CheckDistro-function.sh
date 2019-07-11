#!/usr/bin/env bash

check_distro()
{

	# /etc/os-release is the newer standard w/ systemd, look for that first
	if [ -f "/etc/os-release" ]
	then
		echo "/etc/os-release found"
		DISTRO=$(cat /etc/os-release | head -n 1 | cut -d "=" -f 2 | tr '[:upper:]' '[:lower:]' | tr -d '\"')
	# hostnamectl is still newer, but a nice fallback and exists on some systems not running systemd (ex: Ubuntu 14.04
	elif [ -x "$( command -v hostnamectl )" ]
	then
		echo "hostnamectl found"
		DISTRO=$(hostnamectl | grep "Operating System" | cut -d ":" -f 2 | sed -e 's/^[[:space:]]*//' | tr '[:upper:]' '[:lower:]')

	fi

	if [[ ${DISTRO} == *"arch"* || ${DISTRO} == *"manjaro"* ]]
	then
		echo "Distro is ArchLinux based"
	elif [[ ${DISTRO} == *"centos"* || ${DISTRO} == *"fedora"* || ${DISTRO} == *"rhel"* ]]
	then
	    echo "Distro is RedHat based"
	elif [[ ${DISTRO} == *"debian"* || ${DISTRO} == *"ubuntu"* || ${DISTRO} == *"mint"* ]]
	then
		echo "Distro is Debian-based"
	fi

	echo "${DISTRO}"
}

check_distro
