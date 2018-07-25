#!/usr/bin/env bash

function ver() {
	echo "${BASH_VERSION:-unknown}"
}

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

# open file in MacOS Quicklook Preview
function ql() {
	qlmanage -p "$*" >& /dev/null;
}

# git ignore (https://www.gitignore.io/docs)
function gi() {
	curl -L -s "https://www.gitignore.io/api/$@";
}

function git_prune() {
	local pattern=${1:-""}
	if [[ -z "$pattern" ]]; then
		echo 'branch pattern expected!'
	else
		echo "$ git branch -d $(git branch | grep -E "$pattern")"
		git branch -d $(git branch | grep -E "$pattern")
	fi
}

# list process owned by my user
function my_ps() {
	ps $@ -u $USER -o uid,pid,%cpu,%mem,start,time,command;
}

function iii() {
	echo "$(uname -av)"
	echo "CPU:		$(sysctl -n machdep.cpu.brand_string)"
	echo "OS:		$(sysctl -n machdep.cpu.brand_string)"
	echo "Kernel:	$(sysctl -n kern.version)"
}
