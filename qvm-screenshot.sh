#!/bin/bash
# Author: Scott Willett
# Version: 10/04/2022
# 
# After vetting this script, copy to dom0 (this can help with that: https://www.qubes-os.org/doc/how-to-copy-from-dom0/)
# I recommend creating the dir /opt/qvm-screenshot and placing it there
# Go to your Qubes app menu > system tools > keyboard
# Click add and browse to this file. Assign the shortcut "Windows Key + S" (or Super + S).
#
# Setting this up will mean pressing "Windows key + S" (or Super + S) will allow you to select a region of your screen for a screenshot, and upload it as a timestamped .png to your vm (vault by default in this script)




# A Qube to copy the file to. Edit as you desire

ID=`xdotool getwindowfocus`
QUBE=`xprop _QUBES_VMNAME -id $ID|cut -f2 -d\" `
notify-send "copy to qube:" $QUBE



# A little help from here on this: https://tecadmin.net/get-current-date-and-time-in-bash/
CURRENTTIME=`date +"%Y-%m-%d_%T"`

# The file is saved as 'screenshot_#datetime#.png' in the users Pictures folder in dom0
SCREENSHOT="/home/$USER/Pictures/screenshot_${CURRENTTIME}.png"

# Take the screenshot
xfce4-screenshooter -r -s $SCREENSHOT

# Move the screenshot into the defined Qube. Should be in QubesIncoming on that Qube.
qvm-move-to-vm $QUBE $SCREENSHOT

# Delete the screenshot from dom0
rm -f $SCREENSHOT
