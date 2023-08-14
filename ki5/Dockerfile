FROM ghcr.io/inti-cmnb/kicad5_auto_full:latest_deps
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad 5 w/KiBot and other automation scripts (full)"
LABEL org.opencontainers.image.description "KiCad 5 w/KiBot and other automation scripts (full)"

# Install the Blender plug-in
COPY  enable_pcb2blender.py /usr/bin/
RUN     curl -L https://github.com/30350n/pcb2blender/releases/download/v2.1-k6.0-b3.4/pcb2blender_importer_2-1.zip -o pcb2blender_importer_2-1.zip && \
	blender --background --python /usr/bin/enable_pcb2blender.py && \
	rm pcb2blender_importer_2-1.zip
# Install all the tools, dependencies are already installed
RUN     apt-get update  && \
	dl_deb.py INTI-CMNB/KiBoM && \
	dl_deb.py INTI-CMNB/kicad-git-filters && \
	dl_deb.py set-soft/kicost-digikey-api-v3 && \
	dl_deb.py hildogjr/KiCost && \
	dl_deb.py INTI-CMNB/InteractiveHtmlBom && \
	dl_deb.py INTI-CMNB/KiAuto && \
	dl_deb.py INTI-CMNB/kidiff && \
	dl_deb.py INTI-CMNB/KiBot && \
	apt-get -y install --no-install-recommends ./*.deb && \
	apt-get -y autoremove && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
