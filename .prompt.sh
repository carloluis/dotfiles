#!/usr/bin/env bash

function prompt_git() {
	local branchname='';
	local on=${1:-"${white} on ${violet}"}
	local statuscolor=${2:-"${blue}"}
	local status='';

	# check if the current directory is in a git repository
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running checks
		if [ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]; then

			# ensures the index is up to date
			git update-index --really-refresh -q &>/dev/null;

			# check for uncommitted changes in the index
			if ! $(git diff --quiet --ignore-submodules --cached); then
				status+='+';
			fi;

			# check for unstaged changes
			if ! $(git diff-files --quiet --ignore-submodules --); then
				status+='!';
			fi

			# check for untracked files
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				status+='?';
			fi;

			# check for stashed files
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				status+='$';
			fi
		fi

		# get the short symbolic ref.
		# if HEAD isn't a symbolic ref, get the short SHA for the latest commit
		# otherwise, just give up
		branchname="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || \
			git rev-parse --short HEAD 2>/dev/null || \
			echo '(unknown)')";

		# ... or simply do
		# branchname="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"

		[ -n "${status}" ] && status=" [${status}]";

		echo -e "${on}${branchname}${statuscolor}${status}";
	else
		return;
	fi
}

if [[ $(tput longname 2>/dev/null) ]]; then
	# Solarized colors, taken from http://git.io/solarized-colors.
	tput sgr0; # reset
	orange=$(tput setaf 166);
	yellow=$(tput setaf 228);
	red=$(tput setaf 124);
	green=$(tput setaf 71);
	violet=$(tput setaf 61);
	blue=$(tput setaf 33);
	white=$(tput setaf 15);
	gray=$(tput setaf 242);
	bold=$(tput bold);
	reset=$(tput sgr0);
fi

if [[ "${USER}" == "root" ]]; then
	usercolor="${red}";
else
	usercolor="${orange}";
fi

PS1="\n";
PS1+="\[${gray}\]\[\e(0\]lq\[\e(B\] ";
PS1+="\[${bold}\]\[\${usercolor}\]\u";
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h";
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";
PS1+="\$(prompt_git)"
PS1+="\n";
PS1+="\[${gray}\]\[\e(0\]mq\[\e(B\] ";
PS1+="\[${white}\]\$ ";
PS1+="\[${reset}\]"
export PS1;

PS2="\[${white}\]→ \[${reset}\]";
export PS2;
