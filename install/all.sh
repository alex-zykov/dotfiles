#!/bin/bash
# Run all installers in order. Each one is idempotent — safe to re-run.
cd "$(dirname "$0")"
for script in sdkman-jvm.sh volta-node.sh conda-python.sh rbenv-ruby.sh golang.sh; do
    echo ""
    echo "############ $script ############"
    bash "$script" || echo "!!! $script failed — continuing"
done
