#!/usr/bin/env bash

if [[ -f ~/.bash_profile ]]; then
	[[ -n "$PS1" ]] && source ~/.bash_profile
fi
