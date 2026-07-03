#!/bin/bash
# JVM toolchain via SDKMAN:
#   - Amazon Corretto 21 + Eclipse Temurin 21 (Temurin as default)
#   - sbt (latest)
#   - Scala latest + 2.13 (latest as default)
set -e

if [ ! -d "$HOME/.sdkman" ]; then
    echo "==> Installing SDKMAN..."
    curl -s "https://get.sdkman.io" | bash
fi
export SDKMAN_DIR="$HOME/.sdkman"
set +e  # sdkman-init and sdk are not set -e clean
source "$SDKMAN_DIR/bin/sdkman-init.sh"

echo "==> Resolving latest Java 21 builds..."
java_list=$(sdk list java)
temurin=$(echo "$java_list" | grep -o '21\.[0-9.]*-tem' | head -1)
corretto=$(echo "$java_list" | grep -o '21\.[0-9.]*-amzn' | head -1)
echo "    Temurin:  $temurin"
echo "    Corretto: $corretto"

sdk install java "$corretto"
sdk install java "$temurin"
sdk default java "$temurin"

echo "==> Installing sbt (latest)..."
sdk install sbt

echo "==> Installing Scala latest + 2.13..."
scala_list=$(sdk list scala)
scala_latest=$(echo "$scala_list" | grep -oE '3\.[0-9]+\.[0-9]+' | sort -V | tail -1)
scala_213=$(echo "$scala_list" | grep -oE '2\.13\.[0-9]+' | sort -V | tail -1)
echo "    Scala latest: $scala_latest, 2.13: $scala_213"
sdk install scala "$scala_213"
sdk install scala "$scala_latest"
sdk default scala "$scala_latest"

echo "==> Done. Active versions:"
sdk current java
sdk current sbt
sdk current scala
