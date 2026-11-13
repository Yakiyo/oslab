#!/usr/bin/env bash
# CSE 4502 OS Lab: install and check the tools inside WSL 2 (Ubuntu) on Windows.
# Run inside the Ubuntu terminal, from the CSE4502_OS_Lab directory:
#     bash setup.sh
set -e
cd "$(dirname "$0")"
. ./mcertikos/scripts/common_check.sh

case "$PWD" in
	/mnt/*)
		echo "The project is on the Windows drive ($PWD)."
		echo "Move it into your Linux home directory first (see SETUP.md, step 3)."
		exit 1 ;;
esac

echo "Installing the tools (enter the Ubuntu password you chose)..."
sudo apt-get update
sudo apt-get install -y build-essential gcc-multilib gdb make perl python3 \
	qemu-system-x86 git unzip

if [ -e /dev/kvm ] && ! id -nG | grep -qw kvm; then
	sudo usermod -aG kvm "$USER" && \
		echo "Added you to the kvm group: close Ubuntu, run 'wsl --shutdown' in PowerShell, and reopen Ubuntu."
fi

CC_CHECK=gcc
check_tools
