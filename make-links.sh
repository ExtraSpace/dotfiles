#!/bin/bash



if [ "$1" = "doom" ]; then
	if [ -f ~/.spacemacs ]; then  
		unlink ~/.spacemacs
	fi
	ln -sf ~/dotfiles/doom/.doom.d ~ && ln -sf ~/dotfiles/doom/.emacs.d ~	
elif [ "$1" = "spacemacs" ]; then
	if [ -f ~/.doom.d ]; then
		unlink ~/.doom.d
	fi
	ln -sf ~/dotfiles/spacemacs/.spacemacs ~ && ln -sf ~/dotfiles/spacemacs/.emacs.d ~
else
	echo "Need argument either doom or spacemacs"
fi

