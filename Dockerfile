FROM centos:7

ENTRYPOINT ['/init']

#Install s6-overlay
RUN cd /tmp && \
    curl -O https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz && \
    tar xvf /tmp/s6-overlay-amd64.tar.gz -C / --exclude="./bin" --exclude="./sbin" && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin && \
    rm -rf s6-overlay-amd64.tar.gz
#Install vsftpd
RUN yum install -y vsftpd openssl

COPY ./config /
