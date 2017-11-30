FROM rhel7.2

MAINTAINER AFS PAAS <tbd@tbd.com>

RUN yum update -y\
    && yum install -y wget unzip
	
RUN yum install -y tar curl

RUN cd /opt;wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz; pwd

RUN alternatives --install /usr/bin/java java /opt/jdk1.7.55/bin/java 2


RUN cd /tmp;wget http://apache.mirrors.pair.com/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz 
 
 # untar and move to proper location
RUN cd /tmp;tar xvf apache-tomcat-7.0.61.tar.gz
 
RUN cd /tmp;mv apache-tomcat-7.0.61 /opt/tomcat7
 
RUN chmod -R 755 /opt/tomcat7
 
ENV JAVA_HOME /opt/jdk1.7.0_55
 
EXPOSE 8080
 
CMD /opt/tomcat7/bin/catalina.sh run