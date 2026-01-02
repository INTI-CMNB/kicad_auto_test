FROM ghcr.io/inti-cmnb/kicad5_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

RUN     apt-get update  && \
	echo "Support for KiCad dark look for default GNOME"  && \
	apt-get -y install --no-install-recommends gnome-themes-extra-data  && \
	echo "XLSX Writer 3 fixes some important limitations in URLs (used by KiBoM, KiCost, KiBot, etc.)"  && \
	curl -O http://http.us.debian.org/debian/pool/main/x/xlsxwriter/python3-xlsxwriter_3.0.2-2_all.deb  && \
	apt-get -y install --no-install-recommends ./*.deb && \
	apt-get -y install --no-install-recommends python3-mistune && \
	echo "SSH client"  && \
	apt-get -y install --no-install-recommends openssh-client && \
	curl -O http://http.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20250419_all.deb && \
	apt-get -y install --no-install-recommends ./*.deb && \
	apt-get -y autoremove && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

# Fix for the .deb downloader, should be removed in the next OS iteration
COPY dl_deb.py /usr/bin/
