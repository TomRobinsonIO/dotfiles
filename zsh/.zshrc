# Set Neovim as MANPAGER
# export MANPAGER='nvim +Man!'

# Set Neovim as EDITOR
export EDITOR='nvim'

# Set bat as MANPAGER
export MANPAGER=batman
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin/:$PATH"

# Set GOPATH
export GOPATH="$HOME/.local/"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
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

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
  export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
  export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"


#Bat Themes
# export BAT_THEME="Catppuccin-mocha"
export BAT_THEME="Nord"

#FZF Options
# Nord Theme
export FZF_DEFAULT_OPTS=" \
--color=fg:#e5e9f0,bg:#2E3440,hl:#81a1c1 \
--color=fg+:#e5e9f0,bg+:#2E3440,hl+:#81a1c1 \
--color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac \
--color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b \
--height 40% --border"

# Catppuccin-mocha Theme
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --height 40% --border"

# FZF use ripgrep, but you can use also ag, fd
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"

#ZSH Syntax Highlighting Theme
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use wrapper script for lf to allow image previews
# alias lf='lfub'

# Replace lf with Eza
alias ls='eza --icons'

# WireGuard Quick Aliases
alias wgup='wg-quick up wg1'
alias wgdn='wg-quick down wg1'

# Docker-Compose Alias
alias dcp='docker-compose -f /opt/docker/compose/compose.yaml'

# Tail last 50 lines of docker logs
alias dtail='docker logs -tf --tail='50' '

# Remove unused images (useful after an upgrade)
alias dprune='docker image prune'

# Remove unused images, unused networks *and data* (use with care)
alias dprunesys='docker system prune --all'

# taskwarrior aliases
alias t='task'
alias ta='task add'
alias ts='task sync'
alias tm='task modify'
alias tb='task burndown.daily'
alias tl='task long'
alias tt='task timesheet'
alias tmod='task modify'
alias tcal='task calendar'
alias tsync='task sync'

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'

bindkey -s '^g' '^ulazygit\n'

bindkey -s '^a' '^ubc -lq\n'

bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

bindkey -s '^e' '^unvim "$(fzf)"\n'

# Enable thefuck
eval $(thefuck --alias)


case `uname` in
  Darwin)
    # commands for OS X go here

    # Default Browser
    export BROWSER="open /Applications/Brave\ Browser.app"

    #Enable z - Jump Around
    . `brew --prefix`/etc/profile.d/z.sh

    # disable special creation/extraction of ._* files by tar, etc. on Mac OS X
    COPYFILE_DISABLE=1; export COPYFILE_DISABLE

    #Bitwarden Session
    source ~/.cache/bwcache

    #iterm shell integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

    alias sudoedit="sudo nvim"

    #XDG Home in Path
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"

    # Linux Utils in Path
    export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"
    export PATH="/opt/homebrew/opt/util-linux/sbin:$PATH"
  ;;
  Linux)
    # commands for Linux go here
    . /usr/share/z/z.sh

    #default editor
    SUDO_EDITOR=/usr/bin/nvim
    export SUDO_EDITOR

    #default Browser
    export BROWSER="brave"
    
    #Java
    export JAVA_HOME="/usr/lib/jvm/java-19-openjdk"

    #nvm for node version management
    # source /usr/share/nvm/init-nvm.sh

    # Aliases
    alias tut="tut-mastodon"
    if command -v batcat > /dev/null 2>&1
    then
        alias bat="batcat"
        export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
    fi
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Syntax hightlighting for Cisco Devices
ssh() { /usr/bin/ssh "$@" | ct; }


#nvm for node version management
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
