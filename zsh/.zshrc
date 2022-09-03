# Set Neovim as MANPAGER
export MANPAGER='nvim +Man!'

# Set bat as MANPAGER
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
  export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
  export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

export PATH="/usr/local/sbin:$PATH:$HOME/.local/bin"

#Bat Themes
export BAT_THEME="Catppuccin-mocha"

#FZF Themes
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

#ZSH Syntax Highlighting Theme
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


case `uname` in
  Darwin)
    # commands for OS X go here

    #Enable z - Jump Around
    . `brew --prefix`/etc/profile.d/z.sh

    # disable special creation/extraction of ._* files by tar, etc. on Mac OS X
    COPYFILE_DISABLE=1; export COPYFILE_DISABLE

    #iterm shell integration
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

    alias sudoedit="sudo nvim"

    #nvm for node version management
    export NVM_DIR="$HOME/.nvm"
    source $(brew --prefix nvm)/nvm.sh #This loads nvm
  ;;
  Linux)
    # commands for Linux go here
    . /usr/share/z/z.sh

    #default editor
    SUDO_EDITOR=/usr/bin/nvim
    export SUDO_EDITOR

    #nvm for node version management
    source /usr/share/nvm/init-nvm.sh
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
