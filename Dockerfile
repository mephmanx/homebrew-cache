FROM centos:8
MAINTAINER mephmanx@gmal.com
RUN yum install -y curl git
COPY init.sh /
CMD [ "./init.sh"]