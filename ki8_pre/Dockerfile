FROM ghcr.io/inti-cmnb/kicad8_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description "Layer used for new dependencies"

RUN     apt-get update  && \
	echo "Support for KiCad dark look for default GNOME"  && \
	apt-get -y install --no-install-recommends gnome-themes-extra-data  && \
	echo "Missing mistune"  && \
	apt-get -y install --no-install-recommends python3-mistune && \
	echo "SSH client"  && \
	apt-get -y install --no-install-recommends ssh && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
