#!/bin/bash
###########
#
# just slightly easier to source it all 
# and set resource limits
#
###########

thisfile=$0
dotfilesdir="$HOME/dotfiles"
workingdir="$HOME/dotworking"

# variables for public consumption of $dotfiles
somepersonaldomain="rota.la"
someworkplace="myjobplace.com"

if [ ! -e $workingdir ]; then
  mkdir $workingdir
fi

rsync -av --exclude=".git"  $dotfilesdir/ $workingdir

# regex that shit
perl -pi -e "s/somepersonaldomain.com/$somepersonaldomain/g" $workingdir/*
perl -pi -e "s/someworkplace.com/$someworkplace/g" $workingdir/*

# push it home
for dotfile in .bashrc .bash_aliases .vimrc .vim .config
do
  cp -r $workingdir/$dotfile $HOME
done

source $HOME/.bash_aliases

