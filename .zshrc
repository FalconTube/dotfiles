# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use zsh custom folder from dotfiles if exist
[[ ! -d ~/.oh-my-zsh-custom ]] || ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
alias task="go-task"

# PATH
path+=("$HOME/go/bin")
path+=("$HOME/.local/bin")
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude go'
export CHROME_EXECUTABLE="/usr/bin/thorium-browser"
export EDITOR='nvim'

# Optional aliases, if exist
if command -v exa &> /dev/null; then
  alias ls='eza'
fi
if command -v nvim &> /dev/null; then
  alias vim='nvim'
  alias vi='nvim'
  alias v='nvim'
fi
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi
if command -v neovide &> /dev/null; then
  alias nv='neovide'
fi
if command -v zellij &> /dev/null; then
  alias tmux='zellij'
fi

if command -v helix &> /dev/null; then
  alias hx="helix"
fi

alias grm="go run main.go"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/yannic/.dart-cli-completion/zsh-config.zsh ]] && . /home/yannic/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
