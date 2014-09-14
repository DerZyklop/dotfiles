# dotfiles

These are my personal dotfiles.

I wouldn't recommend to use it as it is for your project. It's not documented.
It's just a collection files and configurations, that i use.

## Requirements

The install process will ask you what to do before every critical installation.

### How to install from sratch

```
cd ~; mkdir .dotfiles; cd .dotfiles; curl -#L https://github.com/DerZyklop/dotfiles.git | tar -xzv --strip-components 1; sh init.sh;
```

### How to install with git

```
git clone https://github.com/DerZyklop/dotfiles.git .dotfiles; cd .dotfiles; . init.sh
```

### How to deinit

```
sh deinit.sh
```
