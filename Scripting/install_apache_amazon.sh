#!/bin/bash

echo " Updating packages..."
sudo yum update -y

echo " Installing Apache..."
sudo yum install httpd -y

echo " Starting Apache service..."
sudo systemctl start httpd

echo " Enabling Apache to run on boot..."
sudo systemctl enable httpd

echo " Creating custom directory..."
sudo mkdir -p /var/www/html/myapp

echo " Moving index.html to Apache directory..."
sudo mv index.html /var/www/html/myapp/

echo " Setting permissions..."
sudo chmod -R 755 /var/www/html/myapp

echo " Fetching Public IP..."
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)

echo "Done! Visit: http://$PUBLIC_IP/myapp"
