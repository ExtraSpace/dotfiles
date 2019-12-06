#!/bin/bash

if [ "$1" = "doom" ]; then
	if [ -f $HOME/spacemacs ]; then  
		unlink $HOME/.spacemacs
	fi
	ln -sf $HOME/dotfiles/doom/.doom.d $HOME && ln -sf $HOME/dotfiles/doom/.emacs.d $HOME	
elif [ "$1" = "spacemacs" ]; then
	if [ -f $HOME/.doom.d ]; then
		unlink $HOME/.doom.d
	fi
	ln -sf $HOME/dotfiles/spacemacs/.spacemacs $HOME
	if [ -f $HOME/dotfiles/spacemacs/.emacs.d ]; then
		git clone https://github.com/syl20bnr/spacemacs $HOME/dotfiles/spacemacs/.emacs.d
	fi
	ln -sf $HOME/dotfiles/spacemacs/.emacs.d $HOME	
else
	echo "Need argument either doom or spacemacs"
fi

