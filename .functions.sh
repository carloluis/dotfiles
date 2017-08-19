#!/usr/bin/env bash

function dict() {
	curl "dict://dict.org/d:$1"
}

# always do `ls` after `cd`
function cd() {
	builtin cd "$@"; ls;
}

# makes new dir and jumps to dir
function mcd() {
	mkdir -p "$1" && cd "$1";
}

# moves file to trash
function trash() {
	command mv "$@" ~/.Trash;
}

# git ignore (https://www.gitignore.io/docs)
function gi() {
	curl -L -s "https://www.gitignore.io/api/$@";
}
