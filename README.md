# Old Kernel Cleaner

A lightweight, cross-distribution utility to safely remove old Linux kernels while preserving one backup kernel for system stability.

## Overview

Old Kernel Cleaner automatically detects your Linux distribution and safely removes old kernels to free up disk space.
The script intelligently preserves your currently running kernel and one backup kernel for system stability and recovery options.

## Features

- **Cross-Distribution Support**: Works with Debian/Ubuntu, Fedora, and other RPM-based systems
- **Safety First**: Always preserves the running kernel and one backup kernel
- **Zero Configuration**: Auto-detects your distribution and uses appropriate commands
- **Space Efficient**: Removes unnecessary kernel packages and cleans up dependencies

## Usage

Simply run the script with root privileges:

```bash
sudo ./kernel-cleaner.sh
```

## Supported Distributions

- Debian/Ubuntu (using apt)
- Fedora/RHEL 8+ (using dnf)
- CentOS/RHEL 7 (using yum and package-cleanup)

## Installation

```bash
# Download the script
curl -O https://raw.githubusercontent.com/harsh1thX/clear-old-kernels/main/kernel-cleaner.sh

# Make it executable
chmod +x kernel-cleaner.sh

# Run it
sudo ./kernel-cleaner.sh
```

## Why Old Kernel Cleaner?

Linux distributions often accumulate old kernel versions during system updates, which can consume significant disk space over time. While these provide fallback options, most users only need the current kernel and one backup. Old Kernel Cleaner simplifies this maintenance task across different Linux distributions.

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues to suggest improvements.