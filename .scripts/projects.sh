#!/bin/zsh

function createProjectSession() {
	tmux has-session -t $1 

	if [ $? != 0 ]; then
		tmux new -s $1 -d
		tmux send-keys -t $1 'tmux split-window -v -l 10' C-m
		tmux send-keys -t $1 'tmux split-window -h -l 50' C-m
		tmux send-keys -t $1 'tmux select-pane -L' C-m
		tmux send-keys -t $1 'tmux select-pane -U' C-m
		tmux send-keys -t $1 'clear && nvim' C-m
		tmux attach -t $1
	else 
		tmux attach -t $1
	fi

}

function cloud() {
	cd ~/BPower2/mybpower2_wieldy/
	createProjectSession cloud
}

function marta() {
	cd ~/Programming/websites/mkrauz/
	createProjectSession marta
}
