#!/usr/bin/env bash

set -e

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
	# If available, use LSB to identify distribution
	if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
		export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
	# Otherwise, use release info file
	else
		export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
	fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

# Install Ansible
if [ "$DISTRO" == "Ubuntu" ] || [[ "$DISTRO" == *"debian"* ]];; then
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt update
	sudo apt -y install ansible
	export PATH="$PATH:~/.local/bin"
elif [ "$DISTRO" == "arch os" ]; then
	python3 -m venv venv
	source venv/bin/activate
	pip3 install ansible
	export PATH="$PATH:~/.local/bin"
elif [ "$DISTRO" == "ManjaroLinux" ]; then
	sudo apt-add-repository -y ppa:ansible/ansible
	sudo apt update
	sudo apt -y install ansible
	export PATH="$PATH:~/.local/bin"
elif [ "$DISTRO" == "EndeavourOS" ]; then
	python3 -m venv venv
	source venv/bin/activate
	pip3 install ansible
	export PATH="$PATH:~/.local/bin"
elif [ "$DISTRO" == "Fedora" ] || [[ "$DISTRO" == *"fedora"* ]]; then
	sudo dnf -y update
	sudo dnf -y install ansible
	export PATH="$PATH:~/.local/bin"
fi

ansible-galaxy install -r requirements.yml
if [ "$1" == "server" ]; then
    ansible-playbook main.yml --ask-become-pass --tags server
else
    ansible-playbook main.yml --ask-become-pass
fi
