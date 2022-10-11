#!/bin/bash

x=$(cat /etc/os-release)
y=$(echo $x | awk 'NR==1 {print $0}')

if [[ "$y" =~ .*"Ubuntu".* ]]; then
        curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
        sudo apt update -y
        sudo apt  install golang-go -y
	sudo npm install -g pm2
elif [[ "$y" =~ .*"Red Hat".* ]] || [[ "$y" =~ .*"Amazon".* ]]; then
        curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
	sudo yum update -y
        sudo yum install -y golang
else
        echo "Any other OS"
fi
