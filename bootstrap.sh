#!/bin/bash

# Updating apt-get data
apt-get upgrade -y
apt-get update -y

# Docker instalation
apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
if [ -n "`apt-key fingerprint 0EBFCD88`" ]; then
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	apt-get update
	apt-get install docker-ce -y
    usermod -a -G docker vagrant
fi

# Docker Compose instalation
apt-get install docker-compose -y
adduser ubuntu docker

# Latex tools
apt-get install texlive-base texlive-latex-base texlive-fonts-recommended texlive-generic-recommended texlive-latex-recommended texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra texlive-lang-portuguese texlive-lang-english lmodern biber latexmk -y

# Development tools
apt-get install openjdk-9-jdk maven -y
