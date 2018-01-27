# bash info

## aliases

Aliases are commands abbreviation.

Frequently and most used commands are good candidates to create aliases for:

```bash
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10
```

Previous command explained [here](http://linux.byexamples.com/archives/332/what-is-your-10-common-linux-commands/).

### Info

* List all aliases with:

```bash
alias
```

* Bypass an alias: 
    * E.g., if defined: `alias ls="ls -Fh"`, then

```bash
\ls # run ls command
```

* Remove an alias with `unalias` command:

```bash
unalias ls
```

### More

More info on aliases [here](http://tldp.org/LDP/abs/html/aliases.html)

## Shortcuts

```bash
!! # repeat last command
!$ # repeat the last argument of the last command
!:1-$ # repeat all arguments of the last command
!* # repeat all arguments of the last command
```
