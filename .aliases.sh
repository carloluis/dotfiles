#!/usr/bin/env bash

# interactive, verbose (prompt before overwrite, explain what is being done)
alias cp='cp -iv'

# interactive, verbose (prompt before overwrite, print the name of each file before moving it)
alias mv='mv -iv'

# human-readable (print sizes in... e.g., 1K 234M 2G)
alias ls='ls -Fh'

# append indicator to entries, no-group, long listening format, almost-all, human-readable, file-type
alias ll='ls -FGlAhp'

# navigation (cd .. | ~ | -)
alias ..='cd ../'
alias .2='cd ../../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .....='cd ../../../../'
alias -- -="cd -"
alias ~="cd ~"

# open current directory in MacOS Finder
alias finder='open -a Finder ./'

# open file in sublime
alias edit='subl'

# clear terminal
alias c='clear'

# echo all executable paths
alias path='echo -e ${PATH//:/\\n}'

# restore terminal settings when screwed up
alias fix_ssty='stty sane'

# make tab-completion case-insensitive
alias cic='set completion-ignore-case On'

# Git
alias go='git checkout'
