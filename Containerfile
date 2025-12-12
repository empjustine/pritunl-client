FROM docker.io/library/debian:trixie-slim

RUN printf 'deb https://repo.pritunl.com/stable/apt trixie main\n' >/etc/apt/sources.list.d/pritunl.list
RUN apt-get update && apt-get install -y dirmngr && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
RUN apt-get update && apt-get install -y pritunl-client && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY start_pritunl.sh start_pritunl.sh
RUN chmod +x start_pritunl.sh
CMD pritunl-client-service & ./start_pritunl.sh
