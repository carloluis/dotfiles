#!/bin/bash

DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
files=".bashrc .bash_profile .aliases.sh .functions.sh"

for file in $files; do
	if [[ -f ~/"$file" ]]; then
		echo "replace $file into ~"
		rm ~/"$file"
	else
		echo "copying $file into ~"
	fi
	cp "$file" ~
done

source ~/.bashrc
