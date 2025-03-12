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

HXVER="25.01.1"
# Check if helix needs to be installed
DOHELIX=false
if hx --version &>/dev/null; then
  # helix is installed
  ver=$(hx --version | awk '{print $2}')
  if [ "$ver" != "$HXVER" ]; then
    DOHELIX=true
  fi

  else
  # helix not installed yet, needs installation
  DOHELIX=true
fi

if [ "$DOHELIX" = "true" ]; then
  echo "Installing Helix version $HXVER"


  # Install helix and helix runtime
  wget "https://github.com/helix-editor/helix/releases/download/$HXVER/helix-$HXVER-x86_64-linux.tar.xz" -O helix.tar.xz
  mkdir tmp_helix
  tar xf helix.tar.xz -C tmp_helix --strip-components 1
  cp tmp_helix/hx $BINFOLD
  cp -r tmp_helix/runtime $HOME/.config/helix
  rm -rf tmp_helix
else 
  echo "Helix version $HXVER already installed."
fi


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
