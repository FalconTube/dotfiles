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

# Also install tpm if not exist
if not [ -d ~/.tmux/plugins/tpm/ ]; then
  echo "TPM not installed yet. Grabbing it now..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM installed already at ~/.tmux/plugins/tpm/. Skipping installation."
fi
