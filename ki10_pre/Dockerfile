FROM ghcr.io/inti-cmnb/kicad10_debian:latest_full
LABEL MAINTAINER="Salvador E. Tropea <set@ieee.org>"
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

COPY kicad_version.py /usr/bin/
# Coveralls 4.0.2, should be moved to base_os_full
# Python support for ZStandard compression for KiCad 9 embedded files, should be moved to base_os
RUN     apt-get update  && \
	apt-get -y install --no-install-recommends python3-reportlab && \
	dl_deb.py set-soft/coveralls-python && \
	apt-get -y install --no-install-recommends ./*.deb && \
	rm /*.deb && \
	apt-get -y install --no-install-recommends python3-zstd && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

