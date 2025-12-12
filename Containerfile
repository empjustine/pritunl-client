FROM docker.io/library/debian:trixie

COPY pritunl.gpg /usr/share/keyrings/pritunl.gpg
COPY pritunl.list /etc/apt/sources.list.d/pritunl.list
RUN apt-get update && apt-get install -y pritunl-client && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY start_pritunl.sh start_pritunl.sh
RUN chmod +x start_pritunl.sh
CMD pritunl-client-service & ./start_pritunl.sh
