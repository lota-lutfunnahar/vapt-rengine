#!/bin/bash

tput setaf 2;
cat web/art/1.1.txt

tput setaf 1; echo "Before running this script, please make sure Docker is running and you have made changes to .env file."
tput setaf 2; echo "Changing the postgres username & password from .env is highly recommended."

tput setaf 4;
read -p "Are you sure, you made changes to .env file (y/n)? " answer
case ${answer:0:1} in
    y|Y|yes|YES|Yes )
      echo "Continiuing Installation!"
    ;;
    * )
      nano .env
    ;;
esac

echo " "
tput setaf 3;
echo "#########################################################################"
echo "Please note that, this installation script is only intended for Linux"
echo "For Mac and Windows, refer to the official guide https://rengine.wiki"
echo "#########################################################################"

echo " "
tput setaf 4;
echo "Installing reNgine and it's dependencies"

echo " "
if [ "$EUID" -ne 0 ]
  then
  tput setaf 1; echo "Error installing reNgine, Please run this script as root!"
  tput setaf 1; echo "Example: sudo ./install.sh"
  exit
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing curl..."
echo "#########################################################################"
if [ -x "$(command -v curl)" ]; then
  tput setaf 2; echo "CURL already installed, skipping."
else
  sudo apt update && sudo apt install curl -y
  tput setaf 2; echo "CURL installed!!!"
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing Docker..."
echo "#########################################################################"
if [ -x "$(command -v docker)" ]; then
  tput setaf 2; echo "Docker already installed, skipping."
else
  curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
  tput setaf 2; echo "Docker installed!!!"
fi


echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing docker-compose"
echo "#########################################################################"
if [ -x "$(command -v docker-compose)" ]; then
  tput setaf 2; echo "docker-compose already installed, skipping."
else
  curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  tput setaf 2; echo "docker-compose installed!!!"
fi


echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing make"
echo "#########################################################################"
if [ -x "$(command -v make)" ]; then
  tput setaf 2; echo "make already installed, skipping."
else
  apt install make
fi

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Checking Docker status"
echo "#########################################################################"
if systemctl is-active docker >/dev/null 2>&1; then
  tput setaf 4;
  echo "Docker is running."
else
  tput setaf 1;
  echo "Docker is not running. Please run docker and try again."
  echo "You can run docker service using sudo systemctl start docker"
  exit 1
fi



echo " "
tput setaf 4;
echo "#########################################################################"
echo "Installing reNgine"
echo "#########################################################################"
make certs && make build && make up

tput setaf 2; echo "reNgine is installed!!!"

sleep 3

echo " "
tput setaf 4;
echo "#########################################################################"
echo "Creating an account"
echo "#########################################################################"
make username

tput setaf 2; echo "Thank you for installing reNgine, happy recon!!"
