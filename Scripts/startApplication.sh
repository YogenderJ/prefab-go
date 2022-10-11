#!/bin/bash
cd /home/ubuntu/codepipeline/go
#sh -c './server'

#Copy custom_created systemd file
sudo chmod +x my_go.service
sudo cp my_go.service /etc/systemd/system/ 

##add exceutable permissions to go app
sudo chmod +x /home/ubuntu/gitlab/go/server

##Allows any users to write the app folder. Useful if using fs within the app
sudo chmod go+w /home/ubuntu/gitlab/go

##Launches the express app
sudo systemctl daemon-reload
sudo systemctl start my_go.service
sudo systemctl enable my_go.service