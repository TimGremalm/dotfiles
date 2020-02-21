# Make sure environemnt variables is set
ifndef XDG_CONFIG_HOME
	export XDG_CONFIG_HOME := $(HOME)/.config
endif
#${info XDG_CONFIG_HOME is [${XDG_CONFIG_HOME}]}

default: help
	$(info )
	$(info Run a make command)

packages_network = openssh-server nmap net-tools ngrep iftop nmon wget
packages_file = ncdu sshfs
packages_tool = tmux htop w3m
packages_development = git gitk meld python3 python3-dev ipython3 python3-numpy python3-dbus python3-pytest
packages_vim = vim vim-airline vim-airline-themes vim-fugitive vim-youcompleteme
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
	$(info Stow vanilla)
	stow --target $(HOME) bash --verbose

unstow_vanilla:
	$(info unstow_vanilla)
	stow --delete --target $(HOME) bash --verbose

cozy: check_stow_dependencies
	$(info )
	bash dependency_checkinstall.sh $(packages_cozy)
	$(info cozy setup installed.)

check_stow_dependencies:
	bash dependency_checkinstall.sh stow

