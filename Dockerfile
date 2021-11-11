FROM centos:8
MAINTAINER mephmanx@gmal.com
RUN yum install -y curl git
COPY init.sh /tmp
CMD [ "./tmp/init.sh $CF_BBL_INSTALL_TERRAFORM_VERSION"]