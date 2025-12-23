#!/bin/sh
set -e

# The 'install.sh' script is executed as root
VERSION=${VERSION:-"stable"}

echo "Installing Neovim version: ${VERSION}..."
#
# 1. Ensure dependencies (curl, ca-certificates) are present
if ! command -v curl >/dev/null 2>&1; then
    echo "Installing missing dependencies..."
    apt-get update -y
    apt-get install -y curl ca-certificates
fi

# Determine architecture
architecture=$(uname -m)
case ${architecture} in
    x86_64) arch="x86_64" ;;
    aarch64 | arm64) arch="arm64" ;;
    *) echo "Architecture ${architecture} not supported"; exit 1 ;;
esac

# Download and extract the binary
# Using the .tar.gz release for standard Linux environments
URL="https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-${arch}.tar.gz"
echo "downloadng ${URL}"
curl -LO $URL
mkdir -p /opt/local/nvim
tar xzf "nvim-linux-${arch}.tar.gz" -C /opt/local/nvim --strip-components=1

# Clean up
rm "nvim-linux-${arch}.tar.gz"

echo "Neovim installation complete."
