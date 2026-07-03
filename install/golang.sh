#!/bin/bash
# Recent Go via Homebrew. GOPATH is set in zshrc; no GOROOT needed with brew Go.
set -e

echo "==> Installing/upgrading Go..."
brew install go 2>/dev/null || brew upgrade go || true

echo "==> Done:"
go version
