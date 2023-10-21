#!/bin/bash

sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

sudo rm -rf /etc/mysql

