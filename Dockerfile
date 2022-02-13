FROM redhat/ubi8
MAINTAINER mephmanx@gmail.com

RUN yum install -y curl git gcc sudo
RUN git config --global http.sslVerify false

RUN useradd -m -s /bin/zsh linuxbrew && \
    usermod -aG wheel linuxbrew &&  \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R linuxbrew: /home/linuxbrew/.linuxbrew
RUN yum install -y procps && rm -rf /var/lib/apt/lists/*
COPY init.sh /
RUN chmod +x /init.sh
USER linuxbrew
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

ENTRYPOINT ["./init.sh"]