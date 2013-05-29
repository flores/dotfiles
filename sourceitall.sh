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
somepersonaldomain="petalphile.com"
someworkplace="myjobplace.com"

if [ ! -e $workingdir ]; then
  mkdir $workingdir
fi

rsync -av --exclude=".git"  $dotfilesdir/ $workingdir

# regex that shit
perl -pi -e "s/somepersonaldomain.com/$somepersonaldomain/g" $workingdir/*
perl -pi -e "s/someworkplace.com/$someworkplace/g" $workingdir/*

# see if this is a box with a usb dac
usbsound=`aplay -l |awk '/USB/ {print $3}'`
if [ -z $usbsound ]; then
  perl -pi -e "s/USBDEVICE/$usbsound/g" .asoundrc
  cp .asoundrc $HOME
fi

# push it home
for dotfile in .bashrc .bash_aliases .vimrc .vim .config .inputrc
do
  cp -r $workingdir/$dotfile $HOME
done

source $HOME/.bash_aliases

