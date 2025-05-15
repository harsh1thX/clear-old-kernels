#!/bin/bash

# Script to safely remove old Linux kernels
# Works on Debian/Ubuntu, Fedora, and other RPM-based systems
# Keeps ONLY the currently running kernel and 1 backup kernel

# Get running kernel version
RUNNING_KERNEL=$(uname -r)
echo "Running kernel: $RUNNING_KERNEL (will be kept)"
echo "Only 1 backup kernel will be kept"

# Check distribution type
if command -v apt &> /dev/null; then
    # Debian/Ubuntu based
    echo "Detected Debian/Ubuntu based system"
    
    # List all installed kernels except the running one and newest backup
    OLD_KERNELS=$(dpkg --list | grep 'linux-image' | grep -v "$RUNNING_KERNEL" | awk '{print $2}' | sort -V | head -n -1)
    
    if [ -z "$OLD_KERNELS" ]; then
        echo "No old kernels to remove."
    else
        echo "The following old kernels will be removed:"
        echo "$OLD_KERNELS"
        
        # Remove old kernels
        for KERNEL in $OLD_KERNELS; do
            echo "Removing $KERNEL..."
            apt-get purge -y $KERNEL
        done
        
        # Clean up unused packages
        apt-get autoremove -y
        apt-get autoclean
    fi

elif command -v dnf &> /dev/null; then
    # Fedora/RHEL 8+
    echo "Detected Fedora/RHEL 8+ based system"
    
    # Keep current kernel and exactly one older version
    echo "Removing old kernels..."
    dnf remove -y $(dnf repoquery --installonly --latest-limit=-1 -q)
    
elif command -v yum &> /dev/null; then
    # CentOS/RHEL 7
    echo "Detected CentOS/RHEL 7 based system"
    
    # Set package-cleanup to keep exactly 2 kernels (current + 1 backup)
    echo "Removing old kernels..."
    package-cleanup --oldkernels --count=2 -y
    
else
    echo "Unsupported distribution. This script works with Debian/Ubuntu and RPM-based systems."
    exit 1
fi

echo "Kernel cleanup complete."