# Makefile for Tim Gremalms dotfiles https://github.com/timgremalm/dotfiles

default: help
	$(info )
	$(info Run a make command)

packages_network = openssh-server nmap net-tools ngrep iftop nmon wget
packages_file = ncdu sshfs tree mlocate
packages_tool = tmux htop w3m screen
packages_development = git gitk meld python3 python3-pip python3-dev ipython3 python3-numpy python3-dbus python3-pytest
packages_vim = vim vim-addon-manager vim-airline vim-airline-themes vim-youcompleteme vim-ctrlp
packages_cozy = i3 feh inkscape doublecmd-qt qdirstat
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

vanilla: check_stow_dependencies
	$(info )
	bash dependency_checkinstall.sh $(packages_network)
	bash dependency_checkinstall.sh $(packages_file)
	bash dependency_checkinstall.sh $(packages_tool)
	bash dependency_checkinstall.sh $(packages_development)
	bash dependency_checkinstall.sh $(packages_vim)
	$(info )
	$(info vim add plugins)
	vam install youcompleteme
	vam install ctrlp
	git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree 2>/dev/null || echo "Repo nerdtree already exist"
	$(info )
	$(info Stow vanilla)
	stow --target $(HOME) bash --verbose
	stow --target $(HOME) fonts --verbose
	stow --target $(HOME) inputrc --verbose
	stow --target $(HOME) vim --verbose
	stow --target $(HOME) git --verbose
	stow --target $(HOME) tips --verbose
	stow --target $(HOME) tmux --verbose
	stow --target $(HOME) tools --verbose

unstow_vanilla:
	$(info unstow_vanilla)
	stow --delete --target $(HOME) bash --verbose
	stow --delete --target $(HOME) fonts --verbose
	stow --delete --target $(HOME) inputrc --verbose
	stow --delete --target $(HOME) vim --verbose
	stow --delete --target $(HOME) git --verbose
	stow --delete --target $(HOME) tips --verbose
	stow --delete --target $(HOME) tmux --verbose
	stow --delete --target $(HOME) tools --verbose

cozy: check_stow_dependencies
	$(info )
	bash dependency_checkinstall.sh $(packages_cozy)

check_stow_dependencies:
	bash dependency_checkinstall.sh stow

