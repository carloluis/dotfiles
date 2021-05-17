#!/bin/bash

DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
files=".bashrc .bash_profile .aliases.sh .functions.sh .prompt.sh .zshrc"
BACKUP_DIR="$DOTS_DIR/backup"

printf "\nCopying new dotfiles from $DOTS_DIR...\n"
mkdir -p "$BACKUP_DIR"

saved_files=0

for file in $files; do
	if [[ -f ~/"$file" ]]; then
		mv -v ~/"$file" "$BACKUP_DIR"
		((saved_files+=1))
	fi
	cp "$DOTS_DIR/$file" ~
	echo "  📝 --> ~/$file"
done

if [[ $saved_files -gt 0 ]]; then
	echo -e "\nSaved $saved_files files on $BACKUP_DIR:"
	ls -lAh $BACKUP_DIR
fi

source ~/.bashrc
