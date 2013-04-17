#!/bin/bash

# for thinkpads with multiple batteries
# by default BAT0 completely discharges completely before engaging BAT1
# gtk/xfce/etc battery managers do not handle laptops with two batteries
# very well

# wip

path="/sys/class/power_supply"
batts="BAT0 BAT1"
threshold="15" # when to flip it
ac=$(cat $path/AC/online) # are we plugged in?

lockfile="/tmp/batboy" # make it cronable

if [ -e $lockfile ]; then
  echo -e "lockfile $lockfile exists: we're already acting on the battery"
  exit 0
fi

for batt in $batts; do

  if [ -d $path/$batt ]; then
    energy_now=$(cat $path/$batt/energy_now)
    energy_full=$(cat $path/$batt/energy_full)
    energy_per=$(($energy_now * 100 /$energy_full))

    if [ $energy_per -lt $threshold ]; then
      if [ $ac -eq 0 ]; then
	echo "$batt less than $threshold percent!  flipping it off, sorry"
	echo "$batt " >> $lockfile
      else
	echo "we're still charging $batt."
      fi
    else
      if [ $ac -eq 0 ]; then
	echo cool $batt still at $energy_per percent
      else
	rm -f $lockfile
      fi
    fi

  else
    echo "no $batt found"
  fi

done


