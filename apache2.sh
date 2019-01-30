#!/bin/bash

INSTALL_BULK=$1

if [[ "$INSTALL_BULK" = false ]]; then
    sudo apt-get update
fi

sudo apt-get install -y apache2

CURRENT_USER=$USER
CURRENT_USER_GROUP=$(id -g -n $USER)
APACHE_DEFAULT_USER='User ${APACHE_RUN_USER}'
APACHE_NEW_USER="User $CURRENT_USER"
APACHE_DEFAULT_GROUP='Group ${APACHE_RUN_GROUP}'
APACHE_NEW_GROUP="Group $CURRENT_USER_GROUP"
APACHE_CONFIG='/etc/apache2/apache2.conf'
sudo sed -i "s/$APACHE_DEFAULT_USER/$APACHE_NEW_USER/" $APACHE_CONFIG
sudo sed -i "s/$APACHE_DEFAULT_GROUP/$APACHE_NEW_GROUP/" $APACHE_CONFIG
