FROM centos:8
MAINTAINER mephmanx@gmail.com
RUN yum install -y curl git gcc
COPY init.sh /
RUN chmod 777 /init.sh
ENTRYPOINT ["./init.sh"]