FROM centos

RUN yum upgrade -y \\
     && yum install -y epel-release \\
     && yum install -y \\
       wget \\
       resiprocate-turn-server \\
       resiprocate-turn-server-psql \\
     && yum clean all

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

EXPOSE 3478 5349
EXPOSE 34787/udp

VOLUME /etc/reTurn

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/usr/sbin/reTurnServer", "/etc/reTurn/reTurnServer.config"]
