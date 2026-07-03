#!/bin/bash
# Volta + recent Node (LTS) + recent npm
set -e

if ! command -v volta >/dev/null 2>&1 && [ ! -d "$HOME/.volta" ]; then
    echo "==> Installing Volta..."
    curl https://get.volta.sh | bash
fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

echo "==> Installing Node (latest LTS) and npm (latest)..."
volta install node
volta install npm

if [ ! -d "$HOME/.bun" ]; then
    echo "==> Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
fi

echo "==> Done:"
node --version
npm --version
"$HOME/.bun/bin/bun" --version
