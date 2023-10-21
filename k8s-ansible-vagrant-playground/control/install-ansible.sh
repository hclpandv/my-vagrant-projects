#!/usr/bin/env bash

apt-get update && apt-get upgrade
apt-get install -y software-properties-common
add-apt-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible
