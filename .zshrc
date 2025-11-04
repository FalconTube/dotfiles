# Persist zsh history
# From: https://github.com/zsh-users/zsh-autosuggestions/issues/645#issuecomment-1452340220
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Make rm safer
# From: https://github.com/sindresorhus/guides/blob/main/how-not-to-rm-yourself.md#safeguard-rm
alias rm='rm -I'
unsetopt RM_STAR_SILENT

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Various aliases
alias ..="cd .."
alias cf='cd $(find * -type d | fzf)'
alias lg='lazygit'
alias lad='lazydocker'
alias tmux='tmux -2'
alias devbuild='xhost local:$USER && devcontainer up --mount "type=bind,source=$HOME/.config/nvim,target=/home/developer/.config/nvim" --workspace-folder .'
alias vd='devcontainer exec --workspace-folder . nvim'
alias shd='xhost local:$USER && devcontainer exec --workspace-folder . bash'
alias frontend="cd $HOME/Programming/piedbiker/frontend && \
  xhost local:$USER &&
  devcontainer up --mount \"type=bind,source=$HOME/.config/nvim,target=/home/developer/.config/nvim\" --workspace-folder . && \
  devcontainer exec --workspace-folder . 'nvim' --headless --listen 0.0.0.0:6666 &" 
alias grm="go run main.go"
alias vpn-enable="sudo tailscale set --exit-node=100.115.247.78"
alias vpn-disable="sudo tailscale set --exit-node= "
alias dockertask="docker run --rm -it -v \"$(pwd):/app\" ajvlint:latest"

# PATH
path+=("$HOME/.local/bin")
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude go'
export CHROME_EXECUTABLE="/usr/bin/thorium-browser"
export EDITOR='hx'
export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"
export PATH=$PATH:$(go env GOPATH)/bin


# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Optional aliases, if exist
if command -v eza &> /dev/null; then
  alias ls='eza'
fi
if command -v nvim &> /dev/null; then
  alias vim='nvim'
  # alias vi='nvim'
  alias v='nvim'
fi
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi
if command -v zellij &> /dev/null; then
  alias tmux='zellij'
fi

if command -v helix &> /dev/null; then
  alias hx="helix"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/yannic/.dart-cli-completion/zsh-config.zsh ]] && . /home/yannic/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# Use tab for autosuggest completion
bindkey '^L' autosuggest-accept
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# Zellij auto attach on zsh start
ZELLIJ_AUTO_ATTACH="true"
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach main
    else
        zellij -s main
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/yannic/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source <(gopass completion zsh)
