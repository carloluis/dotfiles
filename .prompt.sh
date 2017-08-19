#!/usr/bin/env bash


function prompt_git() {
	local branchName='';
	local s='';

	# check if the current directory is in a git repository
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running checks
		if [ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]; then

			# ensures the index is up to date
			git update-index --really-refresh -q &>/dev/null;

			# check for uncommitted changes in the index
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# check for unstaged changes
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi

			# check for untracked files
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# check for stashed files
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi
		fi

		# get the short symbolic ref.
		# if HEAD isn't a symbolic ref, get the short SHA for the latest commit
		# otherwise, just give up
		branchName="$(git symbolic-ref --quiet --short HEAD 2>/dev/null || \
			git rev-parse --short HEAD 2>/dev/null || \
			echo '(unknown)')";

		# ... or simply do
		# branchName="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi
}

if [[ $(tput longname 2>/dev/null) ]]; then
	# Solarized colors, taken from http://git.io/solarized-colors.
	tput sgr0; # reset colors
	orange=$(tput setaf 166);
	yellow=$(tput setaf 228);
	red=$(tput setaf 124);
	green=$(tput setaf 71);
	violet=$(tput setaf 61);
	blue=$(tput setaf 33);
	white=$(tput setaf 15);
	bold=$(tput bold);
	reset=$(tput sgr0);
fi

PS1="\[${bold}\]\n";
PS1+="\[${orange}\]\u";		# username
PS1+="\[${white}\] at ";
PS1+="\[${yellow}\]\h";		# hostname ()
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";		# working dir
PS1+="\$(prompt_git \"\[${white}\] on ⑂ \[${violet}\]\" \"\[${blue}\]\")"
PS1+="\n";
PS1+="\[${white}\]\$ ";		# `$`
PS1+="\[${reset}\]"			# reset color
export PS1;

PS2="\[${white}\]→ \[${reset}\]";
export PS2;
