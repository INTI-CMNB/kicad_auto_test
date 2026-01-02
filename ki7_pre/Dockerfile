FROM ghcr.io/inti-cmnb/kicad7_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

RUN     apt-get update  && \
	echo "Support for KiCad dark look for default GNOME"  && \
	apt-get -y install --no-install-recommends gnome-themes-extra-data  && \
	echo "Missing mistune"  && \
	apt-get -y install --no-install-recommends python3-mistune && \
	echo "SSH client"  && \
	apt-get -y install --no-install-recommends openssh-client && \
	apt-get -y install --no-install-recommends python3-reportlab && \
	curl -O http://http.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20241223_all.deb && \
	apt-get -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	echo "Nasty patch to support tightframe on KiKit panelization" && \
	pip install --break-system-packages --upgrade shapely && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
