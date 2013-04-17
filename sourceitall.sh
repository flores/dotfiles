#!/bin/bash
###########
#
# just slightly easier to source it all 
# and set resource limits
#
###########

thisfile=$0
dotfilesdir="~/dotfiles"
workingdir="~/dotworking"

# variables for public consumption of $dotfiles
somepersonaldomain="rota.la"
someworkplace="myjobplace.com"

if [ ! -d $workingdir ]; then
  mkdir ~/$workingdir
fi

rsync -av --exclude="$thisfile" $dotfilesdir/ $workingdir

# regex that shit
perl -pi -e "s/somepersonaldomain.com/$somepersonaldomain/g" $workingdir/*
perl -pi -e "s/someworkplace.com/$someworkplace/g" $workingdir/*

# push it home
for dotfile in .bashrc .bash_aliases .bash_aliases_private .vimrc; do
  cp $workingdir/$dotfile ~
done

# will get .bashrc and .bash_aliases
source ~/.bash_profile

# fat limits for personal boxes
ulimit -n 1024000
sysctl -p sysctl.conf


