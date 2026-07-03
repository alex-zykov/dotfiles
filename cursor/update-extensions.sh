#!/bin/bash
# Regenerate the Cursor extensions list.
# Restore on a new machine with:
#   xargs -L1 cursor --install-extension < extensions.txt
cd "$(dirname "$0")"
cursor --list-extensions 2>/dev/null > extensions.txt
echo "Wrote $(wc -l < extensions.txt | tr -d ' ') extensions to extensions.txt"
