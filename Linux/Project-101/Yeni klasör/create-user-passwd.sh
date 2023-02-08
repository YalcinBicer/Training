#!/bin/bash

## Part 2: User and Password Script
#You're working as a System Administrator for a e-commerce company. 
#The latest company initiative requires you to write an ansible file for dozens of servers. 
#You're falling behind schedule and are going to miss your deadline for these ansible files 
#because you are constantly being interrupted by the HR calling you to create new Linux accounts 
#for all the people in the company who have been recruited to test out the company's newest Linux-based application.

#In order to meet your deadline and keep your sanity, you decide to write a shell script 
#that will create new user account and automatically generate a password for each of new account. 
#Once you're done with the shell script you can put the HR in charge of creating new accounts which will finally allow you to work uninterrupted and complete your server deployments on time. 

#Your script accepts user account name and comments as parameter.
#then create a new user and a password for them. At the same time, you want users to change their password, 
#when they login the system at the first time. Please create this bash scripting file named `user_password.sh`. 

# Get the username (login).
read -p "please enter your username: " username

# # Get the real name (contents for the description field).
read -p "please enter your name : " name

#database=`cat /etc/passwd | cut -d':' -f1`


while id "$username" >/dev/null 2>&1; do
    # The user exists, so ask for a new username
    echo "The user $username already exists. Please choose another username."
    read -p "Enter a username: " username
done

# Generate random password
password=$(date +%s%N | sha256sum | head -c32)

# # Create new user account with generated password
sudo useradd $username -c "$name" -m
echo $username:$password | sudo chpasswd
echo "User: $username has been created with password: $password"
read -p "enter a new password: " password
echo "User: $username password has been updated with password: $password"

# NEWUSR=$1
# useradd -m -U $NEWUSR
# PASSWD=$(date | md5sum | cut -c1-8)
# echo $PASSWD | passwd $NEWUSR

# echo -e "$password\n$password\n" | sudo passwd $user
#sudo chage -d 0 $username
