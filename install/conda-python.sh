#!/bin/bash
# Miniconda (via Homebrew cask) + a recent Python env.
# The zshrc already activates conda when present — no `conda init` needed.
set -e

if ! command -v conda >/dev/null 2>&1; then
    echo "==> Installing Miniconda..."
    brew install --cask miniconda
fi

eval "$(conda shell.zsh hook 2>/dev/null || conda shell.bash hook)"

echo "==> Creating 'dev' env with recent Python (if missing)..."
conda env list | grep -q '^dev ' || conda create -y -n dev python=3.12

echo "==> Done:"
conda --version
conda run -n dev python --version
echo "Activate with: conda activate dev"
