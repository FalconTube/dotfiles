#!/bin/bash


if command -v brew &>/dev/null; then
  # Brew already installed
  echo "Brew is already installed :). Exiting..."
  exit 0
fi

# Install via official script
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Eval brew and add to bashrc
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
