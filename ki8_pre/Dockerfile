FROM ghcr.io/inti-cmnb/kicad8_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

RUN curl -O http://http.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20241223_all.deb && \
    apt-get -y install --no-install-recommends ./*.deb && \
    rm *.deb
