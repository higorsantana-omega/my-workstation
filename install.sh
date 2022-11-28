#!/bin/bash

# Removing apt external locks
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

# Updating the repositories
sudo apt update -y 


