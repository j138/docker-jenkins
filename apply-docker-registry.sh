#!/bin/bash
docker-compose build
docker-compose up -d
docker-compose kill
docker tag -f jenkins_datastore 10.141.69.234:5000/jenkins_datastore
docker tag -f jenkins_master 10.141.69.234:5000/jenkins_master
docker push 10.141.69.234:5000/jenkins_datastore
docker push 10.141.69.234:5000/jenkins_master
