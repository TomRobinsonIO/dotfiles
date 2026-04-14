# =============================================================================
# ZSH Configuration
# =============================================================================

# -----------------------------------------------------------------------------
# EDITOR & PAGER SETTINGS
# -----------------------------------------------------------------------------

# Set Neovim as MANPAGER
# export MANPAGER='nvim +Man!'

# Set Neovim as EDITOR
export EDITOR='nvim'

# Set bat as MANPAGER
alias man='batman'
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# -----------------------------------------------------------------------------
# POWERLEVEL10K INSTANT PROMPT
# Must stay near the top - initialization requiring console input goes above
# -----------------------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------------------------------------------------------
# PATH CONFIGURATION
# -----------------------------------------------------------------------------

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin/:$PATH"

# Set GOPATH
export GOPATH="$HOME/.local/"

# -----------------------------------------------------------------------------
# OH-MY-ZSH CONFIGURATION
# -----------------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# If set to "random", it will load a random theme each time oh-my-zsh is loaded.
# To know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------------------------------------------------------
# GUILE LOAD PATHS
# -----------------------------------------------------------------------------

export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

# -----------------------------------------------------------------------------
# BAT THEME
# -----------------------------------------------------------------------------

# Bat Themes
export BAT_THEME="Catppuccin-mocha"
# export BAT_THEME="Nord"

# -----------------------------------------------------------------------------
# FZF CONFIGURATION
# -----------------------------------------------------------------------------

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Options
# Nord Theme
# export FZF_DEFAULT_OPTS=" \
# --color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1 \
# --color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1 \
# --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac \
# --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b \
# --height 40% --border"

# Catppuccin-mocha Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--height 40% --border --multi"

# Gruvbox theme
# export FZF_DEFAULT_OPTS=" \
#  --color=bg+:#3c3836,bg:#32302f,spinner:#8ec07c,hl:#83a598 \
#  --color=fg:#bdae93,header:#83a598,info:#fabd2f,pointer:#8ec07c \
#  --color=marker:#8ec07c,fg+:#ebdbb2,prompt:#fabd2f,hl+:#83a598 \
# --height 40% --border"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# FZF use ripgrep, but you can use also ag, fd
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"

# -----------------------------------------------------------------------------
# ZSH SYNTAX HIGHLIGHTING
# -----------------------------------------------------------------------------

source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -----------------------------------------------------------------------------
# DIRECTORY NAVIGATION TOOLS
# -----------------------------------------------------------------------------

# Use wrapper script for lf to allow image previews
# alias lf='lfub'

# Replace ls with Eza
alias ls='eza --icons'

# LF CD - Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Yazi CD - Use yazi to switch directories and bind it to ctrl-o
function yazicd() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# -----------------------------------------------------------------------------
# UTILITY FUNCTIONS
# -----------------------------------------------------------------------------

fzfedit () { fzf --preview "bat --style=numbers --color=always --line-range :500 {}" | xargs -r $EDITOR ;}

# Package installer with fzf selection
getpkg() {
  local pkg query
  query="$1"

  # Detect package manager based on OS
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS (Homebrew)
    if ! command -v brew &>/dev/null; then
      echo "Error: Homebrew not installed. Install it from https://brew.sh"
      return 1
    fi
    pkg=$(brew search "$query" | tr ' ' '\n' | grep -v '^$' | fzf | awk '{print $1}')
    [[ -z "$pkg" ]] && return 1
    brew install "$pkg"
  elif [[ -f /etc/os-release ]]; then
    # Linux distributions
    . /etc/os-release
    case "$ID" in
      ubuntu|debian)
        pkg=$(apt-cache search "$query" | fzf | awk '{print $1}')
        [[ -z "$pkg" ]] && return 1
        sudo apt install "$pkg"
        ;;
      fedora|rhel|centos)
        pkg=$(dnf search "$query" | fzf | awk '{print $1}')
        [[ -z "$pkg" ]] && return 1
        sudo dnf install -y "$pkg"
        ;;
      arch|manjaro)
        if ! command -v paru &>/dev/null; then
          echo "Error: Paru not found. Install it or switch to 'pacman'."
          return 1
        fi
        pkg=$(paru -Ss "$query" | fzf | awk '{print $2}')
        [[ -z "$pkg" ]] && return 1
        paru -S "$pkg"
        ;;
      *)
        echo "Unsupported Linux distribution: $ID"
        return 1
        ;;
    esac
  else
    echo "Unsupported OS. Manual configuration required."
    return 1
  fi
}

# -----------------------------------------------------------------------------
# KEY BINDINGS
# -----------------------------------------------------------------------------

bindkey -s '^b' '^ubc -lq\n'
bindkey -s '^e' '^ufzfedit\n'
bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'
bindkey -s '^g' '^ulazygit\n'
bindkey -s '^o' '^uyazicd\n'
bindkey -s '^s' '^utermscp\n'

# -----------------------------------------------------------------------------
# DOCKER ALIASES
# -----------------------------------------------------------------------------

# Docker-Compose Alias
alias dcp='docker compose -f /opt/docker/compose/compose.yaml'

# Tail last 50 lines of docker logs
alias dtail='docker logs -tf --tail='50' '

# Remove unused images (useful after an upgrade)
alias dprune='docker image prune'

# Remove shutdown containers
alias dprunecon='docker container prune'

# Remove unused images, unused networks *and data* (use with care)
alias dprunesys='docker system prune --all'

# -----------------------------------------------------------------------------
# TASKWARRIOR ALIASES
# -----------------------------------------------------------------------------

alias t='task'
alias ta='task add'
alias tb='task burndown.daily'
alias th='task +home'
alias tl='task long'
alias tm='task modify'
alias ts='task sync'
alias tt='task timesheet'
alias tw='task +work'
alias tcal='task calendar'
alias tmod='task modify'
alias tsync='task sync'

# -----------------------------------------------------------------------------
# SHELL ENHANCEMENTS
# -----------------------------------------------------------------------------

# Enable thefuck
eval $(thefuck --alias)

# Syntax highlighting for Cisco Devices
ssh() { /usr/bin/ssh "$@" | ct; }

# -----------------------------------------------------------------------------
# NVM (NODE VERSION MANAGEMENT)
# -----------------------------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -----------------------------------------------------------------------------
# OS-SPECIFIC CONFIGURATIONS
# -----------------------------------------------------------------------------

case `uname` in
  Darwin)
    # Commands for macOS go here

    # Default Browser
    export BROWSER="open /Applications/Firefox.app"

    # Disable special creation/extraction of ._* files by tar, etc. on Mac OS X
    COPYFILE_DISABLE=1; export COPYFILE_DISABLE

    # Bitwarden Session
    source ~/.cache/bwcache

    # iTerm shell integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

    # Linux aliases
    alias sudoedit="sudo nvim"
    alias mimeopen="open"

    # XDG Home in Path
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"

    # Linux Utils in Path
    export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
    export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"
  ;;
  Linux)
    # Commands for Linux go here

    # Cargo in Path
    export PATH="$HOME/.cargo/bin:$PATH"

    # Default Editor
    SUDO_EDITOR=/usr/bin/nvim
    export SUDO_EDITOR

    # Default Browser
    export BROWSER="firefox"

    # Java
    export JAVA_HOME="/usr/lib/jvm/java-19-openjdk"

    # NVM for Node Version Management
    # source /usr/share/nvm/init-nvm.sh

    # Load FZF Completions
    source /usr/share/fzf/shell/completion.zsh
    source /usr/share/fzf/shell/key-bindings.zsh

    # Aliases
    alias tut="tut-mastodon"
    if command -v batcat > /dev/null 2>&1
    then
        alias bat="batcat"
        export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
    fi
  ;;
  FreeBSD)
    # Commands for FreeBSD go here
  ;;
esac

# -----------------------------------------------------------------------------
# ZOXIDE (DIRECTORY JUMPER)
# -----------------------------------------------------------------------------

# Enable Zoxide
eval "$(zoxide init zsh)"

# =============================================================================
# END OF ZSHRC
# =============================================================================
