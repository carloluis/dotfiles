#!/usr/bin/env bash

# interactive, verbose (prompt before overwrite, explain what is being done)
alias cp='cp -iv'

# interactive, verbose (prompt before overwrite, print the name of each file before moving it)
alias mv='mv -iv'

# create any necessary parent directories (verbose: list dir. creations)
alias mkdir='mkdir -pv'

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

# networking
alias netcon='lsof -i' # show all open TCP/IP sockets
alias ipInfo='ipconfig getpacket en0' # get info on connections for en0

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

# grep with colors
alias grep='grep --colour'

# disk free space
alias df='df -aH'

# process status
alias ps='ps -ahx'
alias psl='ps -lr'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# Git
alias go='git checkout'

# public ip address
alias myip="curl http://ipecho.net/plain; echo"

# search
alias qfind="find . -name " # quick search for file

# files
alias numFiles='echo $(ls -1 | wc -l)' # number of non-hidden files
alias make1mb='mkfile 1m ./1MB.dat'    # creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'    # creates a file of 5mb size (all zeros)

# gyp fix after macOS update
alias fix_reinstall_xcode='xcode-select --install'
