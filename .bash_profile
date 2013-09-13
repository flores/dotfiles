#!/usr/bin/env bash
# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

#load all my cloudkeys
keys=$( find ~/.ssh -name *pem )

if [[ -n "${keys[@]}" ]]; then
  eval `ssh-agent -s`
  for i in "${keys[@]}"; do
    ssh-add $i
  done
fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
