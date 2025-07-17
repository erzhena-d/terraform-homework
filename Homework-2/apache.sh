#!/bin/bash

sudo apt update
sudo apt install -y apache2
sudo systemctl restart apache2
sudo systemctl enable apache2
echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
