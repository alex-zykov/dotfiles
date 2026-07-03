#!/bin/bash
# rbenv + latest stable Ruby, set as global default.
# The zshrc already runs `rbenv init` when rbenv is present.
set -e

if ! command -v rbenv >/dev/null 2>&1; then
    echo "==> Installing rbenv + ruby-build..."
    brew install rbenv ruby-build
fi
eval "$(rbenv init - bash)"

latest=$(rbenv install -l 2>/dev/null | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | tail -1)
echo "==> Installing Ruby $latest (if missing)..."
rbenv versions --bare | grep -qx "$latest" || rbenv install "$latest"
rbenv global "$latest"

echo "==> Done:"
rbenv version
