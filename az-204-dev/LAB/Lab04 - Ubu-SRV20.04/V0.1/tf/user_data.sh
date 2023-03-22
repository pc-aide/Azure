#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx

# install AspNetCore 6.0
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-6.0
rm packages-microsoft-prod.deb
