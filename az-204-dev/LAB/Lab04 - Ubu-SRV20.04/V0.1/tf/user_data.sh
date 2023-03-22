#!/bin/bash

sudo apt-get update
sudo apt-get install -y nginx

# install AspNetCore 6.0
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-6.0
rm packages-microsoft-prod.deb

# stop nginx
sudo systemctl stop nginx

# test - remplacer default location - Ln48
sudo sed -i '48,/# First attempt/ {s|# First attempt|        proxy_pass http://localhost:5000;\n        proxy_http_version 1.1;\n        proxy_set_header Upgrade $http_upgrade;\n        proxy_set_header Connection keep-alive;\n        proxy_set_header Host $host;\n        proxy_cache_bypass $http_upgrade;|}' /etc/nginx/sites-available/default

# start nginx
sudo systemctl start nginx
