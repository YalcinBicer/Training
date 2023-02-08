#!/bin/bash

## Part 3: Baking up and Cronjob

#Imagine that you are working in Gaming company as DevOps Engineer. 
# Recently, you have deployed a new version of firm's famous Game and it's content are being kept
# under `/home/ec2-user/data` in minute basis. In addition, your manager asked you 
# to be backed `/etc`, `/boot`, and `/usr` up as well. So, `/home/ec2-user/data`, `/etc`, `/boot`, and `/usr` folders need 
# to be backed up and placed in specific folder `/mnt/backup` in every 5 minutes. 
# At the same time, since you should separate each file from others, 
# you have to assign different name to backup files based on hostname of instance and 
# the date-hour-minute of the backup. Each backup file has to be compressed with `.tgz` extension. 
# You can not manage this dynamic process by yourself. You decided to create a bash script and 
# define cronjob for executing this in every 5 minutes. 
# Files which are  `/home/ec2-user/data`, `/etc`, `/boot`, `/usr` have to be backed up. 
# Please write a bash script named `backup.sh` for this task.

# sh /path/to/script/backup.sh
# * * * * * sh /path/to/script.sh &> log_file.log
# 0,5 * * * * bash /usr/local/bin/backup.sh


# What to backup. 
backup_files="/home/ec2-user/data /etc /usr /boot"

# Where to backup to.
destination="/mnt/c/backup"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s) # Display the short host name
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $destination/$archive_file"
date
echo

# Backup the files using tar.
tar czf $destination/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $destination

# for cron
#0,5 * * * * bash /usr/local/bin/backup.sh &> log_file.log

