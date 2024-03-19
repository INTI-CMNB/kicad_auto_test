FROM ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad 8 w/KiBot and other automation scripts (full+experimental)"
LABEL org.opencontainers.image.description "KiCad 8 w/KiBot and other automation scripts (full+experimental)"

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
	dl_deb.py set-soft/pcbnewTransition && \
	dl_deb.py INTI-CMNB/KiKit --skip kikit-doc && \
	dl_deb.py INTI-CMNB/KiAuto && \
	dl_deb.py INTI-CMNB/kidiff && \
	dl_deb.py INTI-CMNB/KiBot && \
	apt-get -y install --no-install-recommends ./*.deb && \
	apt-get -y autoremove && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old
COPY    materials.py /
RUN     cp /materials.py /usr/bin/3.5/scripts/addons/pcb2blender_importer

# Should be moved to kicad_debian
ENV KICAD_AUTO_FULL=1
ARG iteration
ENV KIBOT_ITERATION=$iteration

RUN     kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\) .*/\1/' | tr -d '\n' > /etc/kiauto_tag && \
	echo -n -${KIBOT_ITERATION}_k >> /etc/kiauto_tag && \
	kicad_version.py >> /etc/kiauto_tag && \
	echo -n _d >> /etc/kiauto_tag && \
	cat /etc/debian_version | tr -d '\n' >> /etc/kiauto_tag && \
	echo -n _b >> /etc/kiauto_tag && \
	blender --version | head -n 1 | tr -d 'Blender ' >> /etc/kiauto_tag

# Temporal layer to install current WIP versions of KiAuto, KiDiff and KiBot.
# Should be removed
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
