# Author: Scott Willett
# Version: 10/04/2022

# A Qube to copy the file to
QUBE="vault"

# A little help from here on this: https://tecadmin.net/get-current-date-and-time-in-bash/
CURRENTEPOCTIME=`date +"%Y-%m-%d %T"`

# The file is saved as 'screenshot_#epoch_time#.png' in the users Pictures folder in dom0
SCREENSHOT="/home/$USER/Pictures/screenshot_${CURRENTEPOCTIME}.png"

# Take the screenshot
xfce4-screenshooter -r -s $SCREENSHOT

# Move the screenshot into the defined Qube. Should be in QubesIncoming on that Qube.
qvm-move-to-vm $QUBE $SCREENSHOT

# Delete the screenshot from dom0
rm -f $SCREENSHOT
