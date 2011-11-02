#!/usr/bin/env bash

# will get .bashrc and .bash_aliases
source .bash_profile

# fat limits for personal boxes
ulimit -n 1024000000
sysctl -p sysctl.conf

