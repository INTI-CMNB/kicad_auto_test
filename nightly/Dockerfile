FROM ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad nightly w/KiBot and other automation scripts (full)"
LABEL org.opencontainers.image.description "KiCad nightly w/KiBot and other automation scripts (full)"

# Install the Blender plug-in
COPY  enable_pcb2blender.py /usr/bin/
RUN     curl -L https://github.com/30350n/pcb2blender/releases/download/v2.7-k7.0-b3.6/pcb2blender_importer_2-7.zip -o pcb2blender_importer_2-7.zip && \
	blender --background --python /usr/bin/enable_pcb2blender.py && \
	rm pcb2blender_importer_2-7.zip
# Install all the tools, dependencies are already installed
RUN     apt-get update  && \
	dl_deb.py INTI-CMNB/KiBoM && \
	dl_deb.py INTI-CMNB/kicad-git-filters && \
	dl_deb.py set-soft/kicost-digikey-api-v3 && \
	dl_deb.py hildogjr/KiCost && \
	dl_deb.py INTI-CMNB/InteractiveHtmlBom && \
	dl_deb.py set-soft/pcbnewTransition  && \
	dl_deb.py INTI-CMNB/KiKit --skip kikit-doc && \
	dpkg --ignore-depends kicad -i kicad-git*.deb && \
	dpkg --ignore-depends kicad -i kibom*.deb && \
	dpkg --ignore-depends kicad -i interactivehtmlbom*.deb && \
	dpkg --ignore-depends kicad -i kicost-digi*.deb && \
	dpkg --ignore-depends kicad -i kicost_*.deb && \
	dpkg --ignore-depends kicad -i python3-pcbnewtransition*.deb && \
	dpkg --ignore-depends kicad --ignore-depends kicad-footprints --ignore-depends kicad-symbols -i python3-pymeta*.deb python3-pybars*.deb kikit*.deb && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
RUN     apt-get update && \
	curl https://codeload.github.com/INTI-CMNB/KiAuto/zip/refs/heads/master --output pp.zip && \
	unzip pp.zip && \
	pip3 install --break-system-packages KiAuto-master/ && \
	rm -rf KiAuto-master/ pp.zip && \
	curl https://codeload.github.com/INTI-CMNB/KiDiff/zip/refs/heads/master --output pp.zip && \
	unzip pp.zip && \
	pip3 install --break-system-packages KiDiff-master/ && \
	rm -rf KiDiff-master/ pp.zip && \
	curl https://codeload.github.com/INTI-CMNB/KiBot/zip/refs/heads/dev --output pp.zip && \
	unzip pp.zip && \
	pip3 install --break-system-packages --no-compile KiBot-dev/ && \
	rm -rf KiBot-dev pp.zip && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

#	dl_deb.py INTI-CMNB/KiBot && \
#	dl_deb.py INTI-CMNB/KiAuto && \
#	dl_deb.py INTI-CMNB/kidiff && \
