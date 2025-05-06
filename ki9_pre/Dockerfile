FROM ghcr.io/inti-cmnb/kicad9_debian:latest_full
LABEL MAINTAINER="Salvador E. Tropea <set@ieee.org>"
LABEL Description="Layer used for new dependencies"
LABEL org.opencontainers.image.description="Layer used for new dependencies"

RUN curl -O http://http.us.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20250419_all.deb && \
    apt-get -y install --no-install-recommends ./*.deb && \
    rm *.deb

# 9.0.1 changed the names of various constants related to units
RUN printf "DXF_UNITS_MILLIMETERS = DXF_UNITS_MM\n" >> /usr/lib/python3/dist-packages/pcbnew.py && \
    printf "DXF_UNITS_INCHES = DXF_UNITS_INCH\n" >> /usr/lib/python3/dist-packages/pcbnew.py

# Install shapely. This is installed using pip, but also apt
# 2025-05-06: Now in base_os, can be removed in the next iteration
RUN apt-get update && \
    apt -y install --no-install-recommends python3-shapely && \
    rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

