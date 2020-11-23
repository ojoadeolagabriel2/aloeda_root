#!/bin/sh

sudo echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar

sudo apt update
sudo apt install default-jre
java -version