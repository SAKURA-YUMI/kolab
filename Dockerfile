FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
USER 10001
ADD deploy.sh /deploy
RUN chmod 777 /deploy
ENTRYPOINT [ "/deploy" ]
