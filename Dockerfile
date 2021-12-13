FROM ubuntu:latest

# ADD .staging/packer /usr/local/bin/packer

RUN apt-get update && apt-get install -y \
    curl \
    unzip

RUN set -x && mkdir -p /usr/src/packer \
    && curl -SL 'https://releases.hashicorp.com/packer/1.7.8/packer_1.7.8_linux_amd64.zip' -o /usr/src/packer/packer.zip \
    && unzip /usr/src/packer/packer.zip -d /usr/local/bin/ \
    && chmod a+x /usr/local/bin/packer \
    && rm -r /usr/src/packer

RUN packer version
ENTRYPOINT [ "packer" ]
