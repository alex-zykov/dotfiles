#!/bin/bash
# Homebrew itself + everything in the Brewfile.
# Run this FIRST — the other installers depend on brew.
set -e

if ! command -v brew >/dev/null 2>&1; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/../Brewfile"

# sketchybar runs as a brew service
if ! brew services list | grep -q '^sketchybar.*started'; then
    brew services start sketchybar || true
fi
