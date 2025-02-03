#!/bin/bash
yum install httpd -y
systemctl enable httpd
systemctl start httpd
echo "This is my server" > /var/www/html/index.html