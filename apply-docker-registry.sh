#!/bin/bash
docker-compose build
docker-compose up -d
docker-compose kill
docker tag -f jenkins_jenkins-master 10.141.69.234:5000/jenkins-master
docker tag -f jenkins_jenkins-data 10.141.69.234:5000/jenkins-data
docker push 10.141.69.234:5000/jenkins-master
docker push 10.141.69.234:5000/jenkins-data
