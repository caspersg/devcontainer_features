#!/bin/sh
set -e

# The 'install.sh' script is executed as root
VERSION=${VERSION:-"latest"}

echo "Installing redis cli version: ${VERSION}..."
apt-get update -y
apt-get install -y lsb-release curl gnupg

curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list
apt-get update -y

if [ "${VERSION}" = "latest" ]; then
    apt-get install -y redis-tools
else
    apt-get install -y redis-tools=${VERSION}
fi

echo "redis cli installation complete."
