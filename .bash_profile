#!/usr/bin/env bash

set -o errexit
set -o nounset

# CONFIG: PATH, HISTORY

export PATH="/usr/local/bin:$PATH";

HISTSIZE=1000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:erasedups

[[ -r '.aliases.sh' && -f '.aliases.sh' ]] && source '.aliases.sh'

[[ -r '.functions.sh' && -f '.functions.sh' ]] && source '.functions.sh'
