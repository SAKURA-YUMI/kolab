FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
USER root
RUN echo "0 65535" >> /proc/sys/net/ipv4/ping_group_range
RUN echo 'net.ipv4.ping_group_range = 0 2147483647' >> /etc/sysctl.conf && sysctl -p
ADD deploy.sh /deploy.sh
RUN chmod +x /deploy.sh
CMD /deploy.sh
ENTRYPOINT [ "/deploy.sh" ]
