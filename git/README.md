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

## Configuration file

Inside the `.gitconfig` file we can define *aliases*, *core variables*, custom *colors* for commands output, etc.

* `.git/config`: local configurations (inside a git repository)
* `~/.gitconfig`: global configurations

Check the manual page with: `man git-config`

### Example

Our previous basic config is written to global `.gitconfig` as:

```
[user]
    name = your name
    email = your_email
```

<details>
<summary>Git Config</summary>

Online docs on [git-scm.com](https://git-scm.com/docs/git-config)

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

</details>

<details>
<summary>Git Log</summary>

Using custom format:

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

More info on [pretty-formats](https://git-scm.com/docs/pretty-formats)

</details>

----

## Signing commits

Read Git helps on [signing commits with GPG](https://help.github.com/articles/signing-commits-with-gpg/).

Follow the steps to generate and add your key to [GitHub](https://github.com/settings/keys).

Then, configure git for signing a commit:

```bash
$ git config --global user.signingkey GPG_KEY_ID # GPG_KEY_ID is the fingerprint of the key to use

$ git commit -S -m 'signed commit...' # in order to sign a commit
```

Set globally flag to force sign every commit:

```bash
$ git config --global commit.gpgsign true
```

## Clean up

Delete local branches matching a pattern:

```bash
git branch -D $(git branch | grep -E 'pattern')
```
