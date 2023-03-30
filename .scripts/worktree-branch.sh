#!/usr/zsh

function snd() {
    selected=$(find . -maxdepth 1 -type d | fzf)
    cd $selected
}
