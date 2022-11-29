#!/bin/bash

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.21/discord-0.0.21.deb"
URL_TILIX="https://mirrors.edge.kernel.org/ubuntu/pool/universe/t/tilix/tilix_1.7.7-1ubuntu2_amd64.deb"

DIRECTORY_DOWNLOADS="$HOME/Downloads/programs"

PROGRAMS=(
  virtualbox
)

# Removing apt external locks
sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

# Updating the repositories
sudo apt update -y 

mkdir "$DIRECTORY_DOWNLOADS"
wget -c "$URL_GOOGLE_CHROME"       -P "$DIRECTORY_DOWNLOADS"
wget -c "$URL_DISCORD"             -P "$DIRECTORY_DOWNLOADS"
wget -c "$URL_TILIX"               -P "$DIRECTORY_DOWNLOADS"

# Install packages .deb in downloads
sudo dpkg -i $DIRECTORY_DOWNLOADS/*.deb

# Install packages apt
for program in ${PROGRAMS[@]}; do
  if ! dpkg -l | grep -q $program; then
    apt install "$program" -y
  else
    echo "[INSTALLED] - $program"
  fi
done

# Install packages snap
sudo snap install telegram-desktop


# POST INSTALLATION
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
