#!/bin/zsh

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/work ~/Programming ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    # If selected dir is a git worktree, selection of branch is enabled
    if [[ "${selected_name:(-4):4}" == "_git" ]]; then
        tmux new-session -d -s $selected_name -c $selected
        tmux send-keys -t $selected_name "snd" Enter
        tmux attach -t $selected_name
    else 
        tmux new-session -s $selected_name -c $selected
    fi
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux attach -t $selected_name
