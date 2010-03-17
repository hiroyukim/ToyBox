#!/bin/sh
# 
# depend
sudo aptitude install rsync sun-java6-jdk

# added hadoop user
sudo addgroup -gid 25000 hadoop
sudo adduser --uid 25000 --home /home/hadoop  --shell /bin/bash --system --group hadoop
sudo passwd hadoop

sudo su hadoop
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_key
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

