# bash info

## aliases

> Aliases are commands abbreviation

Frequently and most used commands are good candidates to create aliases for:

```bash
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
```

Previous command [explanation](http://linux.byexamples.com/archives/332/what-is-your-10-common-linux-commands/)

<details>
<summary>More about aliases</summary>

List all aliases:

```bash
alias
```

Bypass an alias (e.g. `alias ls="ls -Fh"`):

```bash
\ls # run ls command
```

Remove an `alias`:

```bash
unalias ls
```

</details>

More info on [aliases](http://tldp.org/LDP/abs/html/aliases.html)

## Bash completion

Install `bash-completion` using [brew](https://brew.sh/ "Homebrew"):

```bash
brew install bash-completion
```

To enable auto-completion, add the following lines to `~/.bash_profile`:

```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
```

## Shortcuts

Bash [histoy expansions](https://sanctum.geek.nz/arabesque/bash-history-expansion/):

```bash
!! # repeat last command
!^ # repeat the first argument of the last command
!$ # repeat the last argument of the last command
!:1-$ # repeat all arguments of the last command
!* # repeat all arguments of the last command
```
