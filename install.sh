#!/bin/bash

DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
files=".bashrc .bash_profile .aliases.sh .functions.sh"

echo "Copying files from: $DOTS_DIR"

for file in $files; do
	echo "copying $file into ~"
	cp "$file" ~
done
