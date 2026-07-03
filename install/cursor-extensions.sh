#!/bin/bash
# Install all Cursor extensions from cursor/extensions.txt.
# Requires the `cursor` CLI (Cursor: Cmd+Shift+P -> "Install 'cursor' command").
set -e

if ! command -v cursor >/dev/null 2>&1; then
    echo "!!! cursor CLI not found — open Cursor and install the shell command first, then re-run."
    exit 1
fi

xargs -L1 cursor --install-extension < "$(dirname "$0")/../cursor/extensions.txt"
