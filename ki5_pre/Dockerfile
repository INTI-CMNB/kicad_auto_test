FROM ghcr.io/inti-cmnb/kicad5_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description "Layer used for new dependencies"

RUN     apt-get update  && \
	echo "Support for KiCad dark look for default GNOME"  && \
	apt-get -y install --no-install-recommends gnome-themes-extra-data  && \
	echo "Use wget to download some stuff"  && \
	apt -y install --no-install-recommends wget && \
	echo "XLSX Writer 3 fixes some important limitations in URLs (used by KiBoM, KiCost, KiBot, etc.)"  && \
	wget http://http.us.debian.org/debian/pool/main/x/xlsxwriter/python3-xlsxwriter_3.0.2-2_all.deb  && \
	apt-get -y install --no-install-recommends ./*.deb && \
	apt-get -y install --no-install-recommends python3-mistune && \
	apt-get -y remove wget && \
	apt-get -y autoremove && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

# Fix for the .deb downloader, should be removed in the next OS iteration
COPY dl_deb.py /usr/bin/

# Should be moved to kicad_debian
ENV KICAD_AUTO_FULL=1

RUN     kicad_version.py > /etc/kiauto_tag && \
	echo -n _d >> /etc/kiauto_tag && \
	cat /etc/debian_version | tr -d '\n' >> /etc/kiauto_tag && \
	echo -n _b >> /etc/kiauto_tag && \
	blender --version | head -n 1 | tr -d 'Blender ' >> /etc/kiauto_tag
