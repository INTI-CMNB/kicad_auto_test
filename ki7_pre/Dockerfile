FROM ghcr.io/inti-cmnb/kicad7_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description "Layer used for new dependencies"

RUN     apt-get update  && \
	echo "Support for KiCad dark look for default GNOME"  && \
	apt-get -y install --no-install-recommends gnome-themes-extra-data  && \
	echo "Missing mistune"  && \
	apt-get -y install --no-install-recommends python3-mistune && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

# Should be moved to kicad_debian
ENV KICAD_AUTO_FULL=1

RUN     kicad_version.py > /etc/kiauto_tag && \
	echo -n _d >> /etc/kiauto_tag && \
	cat /etc/debian_version | tr -d '\n' >> /etc/kiauto_tag && \
	echo -n _b >> /etc/kiauto_tag && \
	blender --version | head -n 1 | tr -d 'Blender ' >> /etc/kiauto_tag
