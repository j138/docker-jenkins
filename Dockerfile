# FROM jenkins:1.609.1
FROM jenkins:latest
MAINTAINER Junya Nakazato

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

ENV JAVA_OPTS="-Xmx3600m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"
# ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
