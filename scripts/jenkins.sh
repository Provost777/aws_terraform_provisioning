#!/bin/bash
# yum update -y 
yum install httpd wget -y 
systemctl start httpd
systemctl enable httpd
echo "<h1>my example terraform provisioning</h1>" > /var/www/html/index.html

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade
# Add required dependencies for the jenkins package
yum install java-11-openjdk -y 
yum install jenkins -y 
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins