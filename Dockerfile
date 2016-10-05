FROM centos

MAINTAINER AFS PAAS <tbd@tbd.com>

RUN yum update -y\
    && yum install -y wget unzip

RUN yum install -y tar curl

RUN cd /opt
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u55-b13/jdk-7u55-linux-x64.tar.gz
RUN pwd

RUN cd /opt
RUN tar xvf jdk-7u55-linux-x64.tar.gz
#RUN mv jdk1.7.55 /opt
RUN mv jdk1.7.0_55/ /opt/
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.55/bin/java 2


RUN cd /tmp
RUN wget http://apache.mirrors.pair.com/tomcat/tomcat-7/v7.0.72/bin/apache-tomcat-7.0.72.tar.gz

 # untar and move to proper location
#RUN cd /tmp
RUN tar xvf apache-tomcat-7.0.72.tar.gz

#RUN cd /tmp;
RUN mv apache-tomcat-7.0.72 /opt/tomcat7

RUN chmod -R 755 /opt/tomcat7

ENV JAVA_HOME /opt/jdk1.7.0_55

EXPOSE 8080

CMD /opt/tomcat7/bin/catalina.sh run
