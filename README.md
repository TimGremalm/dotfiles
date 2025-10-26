# dotfiles
My configuration files for bash, git, i3, tmux, vim, weechat.
- The configuration-folders is split up per software name.
- I utilize [GNU Stow](https://www.gnu.org/software/stow/stow.html) to create symlinks to the users home-path, the original configuration files is still stored in this repo.
- The installation is triggered in the [[Makefile]] and specific targets may install software and dotfiles fo a suitable level.


## Vanilla
A more plain installation of tools and config.
### Install
```bash
make vanilla
```
### Uninstall
```bash
make unstow_vanilla
```

## Cozy
A cozier version of vanilla including vim plugins etc.
### Install
```bash
make cozy
```
### Uninstall
```bash
make unstow_cozy
```

## Extras
Extra software like Weechat, Inkscape, Gimp.
### Install
```bash
make extras
```
### Uninstall
```bash
make unstow_extras
```

