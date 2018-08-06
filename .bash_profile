#!/usr/bin/env bash

set -o errexit
set -o nounset

# CONFIG: PATH, HISTORY

export PATH="/usr/local/bin:$PATH";

HISTTIMEFORMAT="%Y%m%d %T  "
HISTSIZE=2000
HISTFILESIZE=22000
HISTCONTROL=ignoredups:erasedups

[[ -r '.aliases.sh' && -f '.aliases.sh' ]] && source '.aliases.sh'

[[ -r '.functions.sh' && -f '.functions.sh' ]] && source '.functions.sh'

[[ -r '.prompt.sh' && -f '.prompt.sh' ]] && source '.prompt.sh'
