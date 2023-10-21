#!/usr/bin/env bash

#------ This is not an unAttended script. Please provide inputs needed

echo "******** GENERATING KEY **********"
ssh-keygen
# ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa  -q -N ""

echo "******** COPYING PUBLIC KEY ON REMOTE HOST(s) **********"
ssh-copy-id -i ~/.ssh/id_rsa vagrant@10.10.10.61
ssh-copy-id -i ~/.ssh/id_rsa vagrant@10.10.10.62
