FROM jenkins:1.609.1
MAINTAINER Junya Nakazato

USER root
RUN mkdir /var/log/jenkins /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins /var/cache/jenkins
ADD ./init.groovy.d/jenkins-init.groovy /var/cache/jenkins/jenkins-init.groovy
USER jenkins

ENV JAVA_OPTS="-Xmx2800m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log"
