#!/bin/bash
#

# Create local bin folder
BINFOLD=$HOME/.local/bin
mkdir -p $BINFOLD

# Include current dir for eget
export PATH=$PATH:.
export PATH=$PATH:$BINFOLD

# Dependencies

declare -A repos=(
  ["nelsonenzo/tmux-appimage"]="latest"
  ["neovim/neovim"]="latest"
  ["jesseduffield/lazygit"]="latest"
  ["jesseduffield/lazydocker"]="latest"
  ["BurntSushi/ripgrep"]="latest"
  ["sharkdp/fd"]="latest"
  ["sharkdp/bat"]="latest"
  ["eza-community/eza"]="latest"
  ["go-task/task"]="latest"
  ["ajeetdsouza/zoxide"]="latest"
  ["wilfred/difftastic"]="latest"
  ["zellij-org/zellij"]="latest"
  ["junegunn/fzf"]="latest"
  ["sxyazi/yazi"]="latest"
)

# Install all deps via eget
for repo in "${!repos[@]}"; do
  if [ "${repos[$repo]}" = "latest" ]; then
    eget $repo --upgrade-only
    echo ""
  else
    eget $repo --tag ${repos[$repo]}
    echo ""
  fi
done

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Rename nvim
echo "Renaming nvim"
mv $BINFOLD/nvim* $BINFOLD/nvim

# Also install tpm if not exist
# if not [ -d ~/.tmux/plugins/tpm/ ]; then
#   echo "TPM not installed yet. Grabbing it now..."
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# else
#   echo "TPM installed already at ~/.tmux/plugins/tpm/. Skipping installation."
# fi
