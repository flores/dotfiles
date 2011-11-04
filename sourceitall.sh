#!/bin/bash
###########
#
# just slightly easier to source it all 
# and set resource limits
#
###########

# will get .bashrc and .bash_aliases
source ~/.bash_profile

# fat limits for personal boxes
ulimit -n 1024000
sysctl -p sysctl.conf

