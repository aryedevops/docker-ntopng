FROM debian:jessie
MAINTAINER Heiner Peuser <heiner.peuser@weweave.net>

RUN apt-get update && apt-get install -y \
    curl \
    lsb-release
RUN cd /tmp && \
    curl -s --remote-name http://packages.ntop.org/apt/jessie/all/apt-ntop.deb && \
    dpkg -i apt-ntop.deb && \
    rm -rf apt-ntop.deb

RUN apt-get update && apt-get install -y \
    ntopng \
    redis-server \
    libpcap0.8 \
    supervisor \
    libmysqlclient18 \
    wget

RUN cd /bin && \
    wget https://github.com/ohjames/smell-baron/releases/download/v0.3.0/smell-baron && \
    chmod a+x smell-baron

ADD redis.conf /etc/redis.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000
ENTRYPOINT ["/bin/smell-baron"]
CMD ["/usr/bin/supervisord"]