if [[ $(uname -m) == 'arm64' ]]; then
    /opt/homebrew/bin/zsh -c " /opt/homebrew/bin/tmux new-session -ds0 ; /opt/homebrew/bin/tmux new-window ; /opt/homebrew/bin/tmux send '$1' ENTER; /opt/homebrew/bin/tmux a;"
else
    /usr/local/bin/zsh -c " /usr/local/bin/tmux new-session -ds0 ; /usr/local/bin/tmux new-window ; /usr/local/bin/tmux send '$1' ENTER; /usr/local/bin/tmux a;"
fi
# set -x
# zsh -c "${1:-echo "No command passed"}; zsh"
# { set +x; } 2>/dev/null
