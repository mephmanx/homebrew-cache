FROM centos:8
MAINTAINER mephmanx@gmail.com
RUN yum install -y curl git gcc
COPY init.sh /
RUN chmod 777 /init.sh
ENTRYPOINT ["/bin/bash", "-c"]
ENV CF_BBL_INSTALL_TERRAFORM_VERSION=1.0.2
CMD [ "./init.sh $CF_BBL_INSTALL_TERRAFORM_VERSION"]