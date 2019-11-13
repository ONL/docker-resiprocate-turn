FROM centos:7

RUN yum upgrade -y \\
     && yum install -y epel-release \\
     && yum install -y \\
       wget \\
       resiprocate-turn-server \\
       resiprocate-turn-server-psql \\
     && yum clean all

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64
RUN chmod +x /usr/local/bin/dumb-init

RUN sed -i 's/Daemonize = true/Daemonize = false/' /etc/reTurn/reTurnServer.config \
     && sed -i 's/LoggingType = file/LoggingType = syslog/' /etc/reTurn/reTurnServer.config

EXPOSE 3478 5349
EXPOSE 34787/udp

VOLUME /etc/reTurn

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/usr/sbin/reTurnServer", "/etc/reTurn/reTurnServer.config"]
