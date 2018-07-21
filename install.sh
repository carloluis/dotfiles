#!/bin/bash

DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
files=".bashrc .bash_profile .aliases.sh .functions.sh .prompt.sh"
BACKUP_DIR="$DOTS_DIR/backup"

echo "current dir: $DOTS_DIR"
mkdir -p "$BACKUP_DIR"

for file in $files; do
	if [[ -f ~/"$file" ]]; then
		echo "-- backup $file --"
		mv -v ~/"$file" "$BACKUP_DIR"
	fi
	echo "--> ~/$file"
	cp "$file" ~
done

source ~/.bashrc
