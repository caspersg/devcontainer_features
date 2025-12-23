#!/bin/sh
set -e

# The 'install.sh' script is executed as root
VERSION=${VERSION:-"2.13-4.1.1"}

echo "Installing kafka cli version: ${VERSION}..."

apt-get update -y
apt-get install -y curl ca-certificates default-jre

# 2. Install Kafka binaries
URL="https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${VERSION}.tgz"
echo "downloading ${URL}"
curl -LO $URL
tar -xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/local/kafka
ln -s /opt/local/kafka/bin/* /usr/local/bin/

rm kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

echo "kafka cli installation complete."
