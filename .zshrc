#!/usr/bin/env zsh

# <https://www.soberkoder.com/better-zsh-history/>
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY # record timestamp of command in HISTFILE
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # share command history data
# following should be turned off, if sharing history via setopt SHARE_HISTORY
# setopt INC_APPEND_HISTORY

PATH=~/bin:$PATH

# <https://stephencharlesweiss.com/zsh-compinit-insecure-directories/>
# compaudit | xargs chmod g-w
autoload -Uz compinit && compinit

# ----
# Load version control information
autoload -Uz vcs_info
precmd() {
  vcs_info
  print ""
}
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats $'on %F{011}⎇  %b%f'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT='%F{240}┌─%f %B%F{172}%n%f at %F{11}%m%f in %F{82}%~%f %F{63}${vcs_info_msg_0_}%f %F{242}(⌗ → %h)%f %# ${NEWLINE}%b%F{240}└─%f %B$%b '

[[ -r ~/.aliases.sh && -f ~/.aliases.sh ]] && source ~/.aliases.sh

[[ -r ~/.functions.sh && -f ~/.functions.sh ]] && source ~/.functions.sh
