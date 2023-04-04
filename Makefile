# Makefile for Tim Gremalms dotfiles https://github.com/timgremalm/dotfiles

default: help
	$(info )
	$(info Run a make command)

packages_network = openssh-server nmap net-tools ngrep iftop nmon wget curl fail2ban
packages_file = ncdu sshfs tree mlocate
packages_tool = tmux htop w3m screen numlockx
packages_development = git gitk meld python3 python3-pip python3-dev ipython3 python3-numpy python3-dbus python3-pytest setuptools cmake ninja-build autoconf libtool tio pkgconf
packages_vim = vim vim-addon-manager vim-airline vim-airline-themes vim-youcompleteme vim-ctrlp fonts-powerline
packages_cozy = i3 feh arandr doublecmd-qt qdirstat onboard filezilla
packages_extras = inkscape weechat chromium-browser gimp okular youtube-dl vlc timg ffmpeg cool-retro-term
help:
	$(info )
	$(info Welcome user, this makefile will install programs and configure dot files.)
	$(info ==========================================================================)
	$(info )
	$(info The following make targets are available:)
	$(info *  vanilla - Will install vanilla programs and stow related config files:)
	$(info ,    $(packages_network))
	$(info ,    $(packages_file))
	$(info ,    $(packages_tool))
	$(info ,    $(packages_development))
	$(info ,    $(packages_vim))
	$(info )
	$(info *  cozy - Will install cozy programs and stow related config files:)
	$(info ,    $(packages_cozy))
	$(info )
	$(info *  extras - Will install extras programs and stow related config files:)
	$(info ,    $(packages_extras))
	$(info )

vanilla: check_stow_dependencies
	$(info )
	bash dependency_checkinstall.sh $(packages_network)
	bash dependency_checkinstall.sh $(packages_file)
	bash dependency_checkinstall.sh $(packages_tool)
	bash dependency_checkinstall.sh $(packages_development)
	bash dependency_checkinstall.sh $(packages_vim)
	$(info )
	$(info Stow vanilla)
	stow --target $(HOME) bash
	stow --target $(HOME) fonts
	stow --target $(HOME) inputrc
	stow --target $(HOME) vim
	stow --target $(HOME) git
	stow --target $(HOME) tips
	stow --target $(HOME) tmux
	stow --target $(HOME) tools
	stow --target $(HOME) x
	python3 setcolorhostvar.py

unstow_vanilla:
	stow --delete --target $(HOME) bash
	stow --delete --target $(HOME) fonts
	stow --delete --target $(HOME) inputrc
	stow --delete --target $(HOME) vim
	stow --delete --target $(HOME) git
	stow --delete --target $(HOME) tips
	stow --delete --target $(HOME) tmux
	stow --delete --target $(HOME) tools
	stow --delete --target $(HOME) x

cozy: check_stow_dependencies vanilla
	$(info )
	bash dependency_checkinstall.sh $(packages_cozy)
	$(info )
	$(info vim add cozy plugins)
	vam install youcompleteme
	vam install ctrlp
	git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree 2>/dev/null || echo "Repo nerdtree already exist"
	$(info )
	$(info Stow cozy)
	stow --target $(HOME) vimcozy
	stow --target $(HOME) i3
	stow --target $(HOME) pycharm
	stow --target $(HOME) weechat
	stow --target $(HOME) doublecmd

unstow_cozy:
	vam remove youcompleteme
	vam remove ctrlp
	rm -rf ~/.vim/pack/vendor/start/nerdtree 2>/dev/null || echo "No need to remove repo nerdtree"
	stow --delete --target $(HOME) vimcozy
	stow --delete --target $(HOME) i3
	stow --delete --target $(HOME) pycharm
	stow --delete --target $(HOME) weechat
	stow --delete --target $(HOME) doublecmd

extras: check_stow_dependencies vanilla
	$(info )
	bash dependency_checkinstall.sh $(packages_extras)
	$(info )
	$(info Stow extras)
	stow --target $(HOME) weechat

unstow_extras:
	stow --delete --target $(HOME) weechat

check_stow_dependencies:
	bash dependency_checkinstall.sh stow

