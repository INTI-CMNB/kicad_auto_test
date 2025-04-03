FROM ghcr.io/inti-cmnb/kicad9_debian:latest_full
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

RUN curl -O http://http.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20241223_all.deb && \
    apt-get -y install --no-install-recommends ./*.deb && \
    rm *.deb

# 9.0.1 changed the names of various constants related to units
RUN printf "DXF_UNITS_MILLIMETERS = DXF_UNITS_MM\n" >> /usr/lib/python3/dist-packages/pcbnew.py && \
    printf "DXF_UNITS_INCHES = DXF_UNITS_INCH\n" >> /usr/lib/python3/dist-packages/pcbnew.py

