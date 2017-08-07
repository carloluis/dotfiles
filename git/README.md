# Git

## Instalation

```bash
$ brew install git
```

## Basic configuration

Execute the following commands:

```bash
$ git config --global user.name "your name"
$ git config --global user.email your_email
```

## Using Git configuration file

Inside `.gitconfig` file we can define *aliases*, *core* variables, custom *colors* for commands output, etc.

* `.git/config`: local configurations (inside a git repository)
* `~/.gitconfig`: global configurations

Check the manual page with: `man git-config`

### Example 

Our previous basic config is written to global `.gitconfig` as follows:

```
[user] 
    name = your name
    email = your_email
```

---

## Git config

Online docs [here](https://git-scm.com/docs/git-config)

### Colors

Customize colors for Git command output: 
* *branch*, *diff*, *decorate*, *grep*, *interactive*, *status*

### Core

Core variables defines Git behaviour. I.e:

* whitespaces and line endings treatment
* global rules for excluding files
* default editor
* etc.

### Aliases

Shortcuts for git commands. E.g:

* `git ci` -> `git commit`
* `git co` -> `git checkout`
* [...](.gitconfig)

#### Git log using format string

```bash
$ git log --pretty=format:'%h %ad | %s%d [%an]' --graph
```

Placeholders into format string:

* `%h`: commit hash, abbrev
* `%ad`: author date (format respects --date=option)
* `%s`: commit subject
* `%d`: ref names (like the --decorate option)
* `%an`: author name
* `%ae`: author email

More info on pretty-formats [here](https://git-scm.com/docs/pretty-formats)
