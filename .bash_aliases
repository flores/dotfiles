#!/usr/bin/env bash

export TERM=xterm-256color

alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias halt='sudo halt'
alias b='sudo'

# x stuff
alias x='startx'
alias compiz='SKIP_CHECKS=yes LIBGL_ALWAYS_INDIRECT=1 INTEL_BATCH=1 compiz --replace --indirect-rendering &'
alias white='aterm -fg black -bg white +sb &'
function trim() { curl -u Polygonum_sp:myp2ss http://api.tr.im/api/trim_url.json?url=$*; echo -e "\n"; }

# lolcat is awesome
function ls () { /bin/ls $* |lolcat; }
function cat () { lolcat $*; }


#tunage
function burn () 
{ 
	cp -r $*  /tmp/;
	cd /tmp/$*;
	for i in *.mp3; do mv "$i" `echo $i | tr ' ' '_'`; done
	for i in *.mp3; do mpg321 -w `basename $i .mp3`.wav $i; done
	sudo cdrecord dev=OLDATAPI:0,0,0 -eject speed=12 -pad -audio *.wav;
	cd -;
}
function get () { rsync -azv lo@stash.crib:tunage/$* ~/tunage; }
function put () { rsync -azv ~/tunage/$* lo@stash.crib:tunage; }

#load all my keys
for i in `~/.ssh/*pem`; do
	ssh-add $i
done

#crib
function to() { ssh lo@$*; }
alias stash='ssh lo@10.72.100.3'
alias bsd='ssh lo@10.72.100.1'
alias pimp='ssh root@10.72.100.2'
alias bitch_b='ssh root@10.72.100.11'
alias bitch_f='ssh root@10.72.100.12'
alias bitch_m='ssh root@10.72.100.13'

#vps
alias wet='ssh lo@wet.petalphile.com'
alias vd='ssh root@p.stellatus.petalphile.com'
alias burst='ssh root@downoi.petalphile.com'
alias tonina='ssh root@tonina.petalphile.com'

function sync_p () { for i in burst p.stellatus wet; do rsync -azv $* root@$i.petalphile.com:/var/www/logs/images/; rsync -azv $* root@$i.petalphile.com:/var/www2/logs/images/; done; }

#work
function go () { ssh root@$* || ssh root@$*\.writeonglass.com || ssh root@$*\.borderstylo.com || ssh root@$*\.borderstylo.int || ssh root@$*\.retrollectapp.com; }

function qa () { ssh -i ~/.ssh/west-qa.pem root@$*\.writeonglass.com; }
function ec2 () { ssh -i ~/.ssh/east-ec2.pem root@$*\.writeonglass.com; }
function wc2 () { ssh -i ~/.ssh/west-ec2.pem root@$*\.writeonglass.com; }
function esync () { rsync -e 'ssh -i ~/.ssh/east-ec2.pem' -azv $1 root@$2\.writeonglass.com:manual_sync; }
function wsync () { rsync -e 'ssh -i ~/.ssh/west-ec2.pem' -azv $1 root@$2\.writeonglass.com:manual_sync; }
alias ec2_scp='scp -i ~/.ssh/east-ec2.pem '

#wireless
alias scan='sudo iwlist ath0 scanning'
alias fonality='sudo ifconfig eth0 down; sudo ifconfig ath0 up && sudo iwconfig ath0 essid fonality_support key abba66abba; sleep 2; sudo dhclient ath0'
alias crib='sudo ifconfig eth0 down; sudo ifconfig ath0 up && sudo iwconfig ath0 essid kenandbev_up channel 2 key none; sudo dhclient ath0'
alias back='sudo ifconfig eth0 down; sudo ifconfig ath0 up && sudo iwconfig ath0 essid kenandbev_back channel 2 key none; sudo dhclient ath0'
alias front='sudo ifconfig eth0 down; sudo ifconfig ath0 up && sudo iwconfig ath0 essid kenandbev_front channel 2 key none; sudo dhclient ath0'
alias roam='sudo ifconfig eth0 down; sudo ifconfig ath0 up && sudo iwlist ath0 scanning'
alias tether='sudo ifconfig ath0 down; sudo iwconfig ath0 mode ad-hoc; sudo iwconfig ath0 essid "pie"; sudo ifconfig ath0 up; sudo ifconfig ath0 1.2.3.4'

# battery

alias bat='sudo /etc/init.d/sysklogd stop; 
	sudo /etc/init.d/bluetooth stop;
	sudo modprobe -r firewire_ohci pcmcia && sudo modprobe -r yenta_socket; 
	sudo modprobe -r rsrc_nonstatic; 
	sudo modprobe -r firewire_sbp2; 
	sudo modprobe -r rfcomm; 
	sudo modprobe -r l2cap; 
	sudo modprobe -r bluetooth; 
	sudo modprobe -r i2c_i801;  
	sudo modprobe -r ehci_hcd; 
	sudo modprobe -r parport_pc;
	sudo modprobe -r parport;
	sudo modprobe -r sdhci;
	sudo modprobe -r mmc_core;
	/bin/echo min_power | sudo tee /sys/class/scsi_host/host0/link_power_management_policy; 
	/bin/echo 1 | sudo tee /sys/devices/system/cpu/sched_mc_power_savings; 
	/bin/echo 5 | sudo tee /sys/bus/pci/drivers/iwl4965/0000\:03\:00.0/power_level; 
	xbacklight -set 18; 
	sudo hdparm -B 1 -S 24 /dev/sda; 
	/bin/echo 1 | sudo tee /dev/dsp; 
	sudo iwpriv ath0 set_power 5; 
 	sudo ifconfig eth0 down;
	echo 3000 |sudo tee /proc/sys/vm/dirty_writeback_centisecs'

alias maxbat='sudo /etc/init.d/sysklogd stop; 
	sudo /etc/init.d/bluetooth stop;
	sudo modprobe -r firewire_ohci uhci_hcd pcmcia && sudo modprobe -r yenta_socket; 
	sudo modprobe -r rsrc_nonstatic; 
	sudo modprobe -r firewire_sbp2; 
	sudo modprobe -r rfcomm; 
	sudo modprobe -r l2cap; 
	sudo modprobe -r bluetooth; 
	sudo modprobe -r i2c_i801;  
	sudo modprobe -r ehci_hcd; 
	sudo modprobe -r parport_pc;
	sudo modprobe -r parport;
	sudo modprobe -r sdhci;
	sudo modprobe -r mmc_core;
	/bin/echo min_power | sudo tee /sys/class/scsi_host/host0/link_power_management_policy; 
	/bin/echo 1 | sudo tee /sys/devices/system/cpu/sched_mc_power_savings; 
	/bin/echo 5 | sudo tee /sys/bus/pci/drivers/iwl4965/0000\:03\:00.0/power_level; 
	xbacklight -set 18; 
	sudo hdparm -B 1 -S 24 /dev/sda; 
	/bin/echo 1 | sudo tee /dev/dsp; 
	sudo iwpriv ath0 set_power 5; 
 	sudo ifconfig eth0 down;
	echo 3000 |sudo tee /proc/sys/vm/dirty_writeback_centisecs'


