# dotfiles

These are my personal dotfiles. They are mostly inspired by [mathiasbynens's](https://github.com/mathiasbynens/dotfiles/) and [mischah's](https://github.com/mischah/dotfiles) dotfiles.

I wouldn't recommend to use it as it is for your project. It's not documented.
It's just a collection files and configurations, that i use.

## Requirements

The install process will ask you what to do before every critical installation.

### How to install

#### From sratch

```
cd ~; mkdir .dotfiles; cd .dotfiles; curl -#L https://github.com/DerZyklop/dotfiles.git | tar -xzv --strip-components 1; sh init.sh;
```

#### With git

```
git clone https://github.com/DerZyklop/dotfiles.git .dotfiles; cd .dotfiles; . init.sh
```

### Theme

You will now find a new theme in your Terminal settings. If you want it, you should click the default button.

### How to deinit

```
sh deinit.sh
```

## Add custom commands and settings

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="DerZyklop"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="mail@der-zyklop.de"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```
