#!/usr/bin/env bash

set -o errexit
set -o nounset

# CONFIG: PATH

export PATH="/usr/local/bin:$PATH";

[[ -r '.aliases.sh' && -f '.aliases.sh' ]] && source '.aliases.sh'
