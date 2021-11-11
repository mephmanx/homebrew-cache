FROM centos:8
MAINTAINER mephmanx@gmail.com
RUN yum install -y curl git
COPY init.sh /
RUN chmod 777 /init.sh
ENTRYPOINT ["/bin/bash", "-c"]
CMD [ "./init.sh $CF_BBL_INSTALL_TERRAFORM_VERSION"]