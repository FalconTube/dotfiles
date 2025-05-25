#!/bin/bash

# Packages
pkgs=(
  # "fd"
  "bat"
  "eza"
  "go-task"
  # "fzf"
  "yazi"
  "zellij"
  "helix"
  "zoxide"
  "ripgrep"
  "ripgrep-all"
  "lazygit"
  "lazydocker"
  "go"
  "gopls"
  "golangci-lint-langserver"
  "golangci-lint"
  "uv"
  "tldr"
  "7zip"
  "difftastic"
  "trash-cli"
  "gh"
  "taplo" # toml config
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
  "powerlevel10k"
  )

brew install ${pkgs[@]}
