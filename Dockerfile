FROM haproxy:2.2.4
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install haproxyctl -y \
  && rm -rf /var/lib/apt/lists/*
RUN groupadd haproxy && useradd -g haproxy haproxy
RUN mkdir /var/run/haproxy && mkdir /usr/local/etc/haproxy/errors/static
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY backend.map /usr/local/etc/haproxy/backend.map
COPY full.pem /usr/local/etc/haproxy/cert.pem
# For the use of haproxyctl
RUN ln -s /usr/local/etc/haproxy /etc/haproxy
