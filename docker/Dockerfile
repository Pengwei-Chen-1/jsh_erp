# Version 0.0.1
FROM centos:7
MAINTAINER pengwei_chen "pengwei_chen@qq.com"

ENV TOMCAT_HOME=/opt/tomcat
ENV TOMCAT_FILE_NAME=apache-tomcat-7.0.79.tar.gz
ENV TOMCAT_NAME=apache-tomcat-7.0.79

# install jdk
RUN yum -y install java-1.7.0-openjdk*

# install tomcat
COPY ${TOMCAT_FILE_NAME} ${TOMCAT_FILE_NAME}
RUN tar xvf ${TOMCAT_FILE_NAME}
RUN mv apache-tomcat-7.0.79 ${TOMCAT_HOME}
RUN rm -rf ${TOMCAT_FILE_NAME}
RUN rm -f ${TOMCAT_HOME}/bin/*.bat

ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN source /etc/profile

EXPOSE 8080 3306
