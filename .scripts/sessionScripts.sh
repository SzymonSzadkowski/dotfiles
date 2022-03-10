#!/bin/zsh

function ide() {
	tmux split-window -v -p 20 
	tmux split-window -h -p 30
	tmux select-pane -L
	tmux select-pane -U
	nvim
}
