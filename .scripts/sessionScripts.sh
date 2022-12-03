function ide() {
	tmux split-window -v -l 10
	tmux split-window -h -l 50
	tmux select-pane -L
	tmux select-pane -U
	nvim
}
