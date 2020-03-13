FROM alpine:latest

# Add S6 Supervisor
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /

# Install icecast and ices
RUN apk add icecast ices mailcap

# Create necessary folders for persistant data and logs
RUN mkdir /config && \
	mkdir /music && \
	mkdir /etc/services.d/icecast && \
	mkdir /etc/services.d/ices && \
	mkdir /usr/share/icecast/logs

# Add scripts and config files
ADD ices.xml /config
ADD ices.run /etc/services.d/ices/run
ADD icecast.xml /config
ADD icecast.run /etc/services.d/icecast/run
ADD boot.sh /boot.sh
ADD boot.run /etc/cont-init.d/01-boot
ADD permissions /etc/fix-attrs.d/01-conf-files
ADD playlist.sh /usr/local/bin/playlist.sh

# Enter the S6, start services, fix permissions etc.
ENTRYPOINT ["/init"]
