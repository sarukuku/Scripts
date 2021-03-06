######################################################################################
# This script does some basic maintenance operations on Mac OS X (almost any version)#
# Made by Joonas Salovaara / @sarukuku 			               		     #
######################################################################################

# Define some colors
RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
STOPCOLOR='\033[0m'

echo ${RED} Please close all applications before giving the administrator password! The script may ask for your password again during the maintenance process if one specific task takes more than 5 minutes to complete on your system. ${STOPCOLOR}

# Ask for super user passwd before printing the "Starting...". It just looks nicer.
sudo ls / > /dev/null

echo ${BLUE} Starting the maintenance process. ${STOPCOLOR}

echo ${YELLOW} Installing all available system updates... ${STOPCOLOR}
# Install all available software updates
sudo softwareupdate -i -a
echo ${GREEN} Done. ${STOPCOLOR}

echo ${YELLOW} Cleaning log files... ${STOPCOLOR}
# Clean log files
sudo rm -rf /var/log/*
echo ${GREEN} Done. ${STOPCOLOR}

echo ${YELLOW} Emptying trash... ${STOPCOLOR}
# Force empty trash
sudo rm -rf ~/.Trash/*
echo ${GREEN} Done. ${STOPCOLOR}

echo ${YELLOW} Running built in maintenance scripts... ${STOPCOLOR}
# Run maintenance scripts
sudo periodic daily weekly monthly
echo ${GREEN} Done. ${STOPCOLOR}

echo ${YELLOW} Repairing startup volume... ${STOPCOLOR}
# Repair startup volume
sudo fsck -fy
echo ${GREEN} Done. ${STOPCOLOR}

echo ${YELLOW} Repairing disk permissions... ${STOPCOLOR}
# Repair disk permissions
sudo diskutil repairPermissions /
echo ${GREEN} Done. ${STOPCOLOR}

echo ${BLUE} Finished the whole maintenance process. ${STOPCOLOR}
