FROM ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps
LABEL Maintainer="Salvador E. Tropea <set@ieee.org>"
LABEL Description="KiCad nightly w/KiBot and other automation scripts (full)"
LABEL org.opencontainers.image.description="KiCad nightly w/KiBot and other automation scripts (full)"

# Only for NIGHTLY
# ENV PYTHONPATH="/usr/lib/kicad-nightly/lib/python3/dist-packages"
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
	dpkg --ignore-depends kicad -i kicad-git*.deb && \
	dpkg --ignore-depends kicad -i kibom*.deb && \
	dpkg --ignore-depends kicad -i interactivehtmlbom*.deb && \
	dpkg --ignore-depends kicad -i kicost-digi*.deb && \
	dpkg --ignore-depends kicad -i kicost_*.deb && \
	dpkg --ignore-depends kicad -i python3-pcbnewtransition*.deb && \
	dpkg --ignore-depends kicad --ignore-depends kicad-footprints --ignore-depends kicad-symbols --ignore-depends python3-shapely -i python3-pymeta*.deb python3-pybars*.deb kikit*.deb && \
	dpkg --ignore-depends kicad -i kiauto_*.deb && \
	dpkg --ignore-depends kicad -i kidiff_*.deb && \
	dpkg --ignore-depends kicad -i kibot_*.deb && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

# Should be moved to kicad_debian
ENV KICAD_AUTO_FULL=1
ARG iteration
ENV KIBOT_ITERATION=$iteration

# Should be moved
# COPY kicad_version.py /usr/bin/

RUN     kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\) .*/\1/' | tr -d '\n' > /etc/kiauto_tag && \
	echo -n -${KIBOT_ITERATION}_k >> /etc/kiauto_tag && \
	kicad_version.py >> /etc/kiauto_tag && \
	echo -n _d >> /etc/kiauto_tag && \
	cat /etc/debian_version | tr -d '\n' >> /etc/kiauto_tag && \
	echo -n _b >> /etc/kiauto_tag && \
	blender --version | head -n 1 | tr -d 'Blender ' >> /etc/kiauto_tag

# Install KiBot, KiAuto and KiDiff from repos
RUN     dpkg --ignore-depends kicad --remove kibot  && \
	curl https://codeload.github.com/INTI-CMNB/KiBot/zip/refs/heads/dev --output pp.zip && \
	unzip pp.zip && \
	curl https://codeload.github.com/yaqwsx/PcbDraw-Lib/zip/refs/heads/master --output pp2.zip && \
	unzip pp2.zip -d KiBot-dev/kibot/resources/pcbdraw/ && \
	rmdir KiBot-dev/kibot/resources/pcbdraw/footprints && \
	mv KiBot-dev/kibot/resources/pcbdraw/PcbDraw-Lib-master KiBot-dev/kibot/resources/pcbdraw/footprints && \
	pip3 install --break-system-packages --no-compile KiBot-dev/ && \
	rm -rf KiBot-dev pp.zip pp2.zip && \
	dpkg --ignore-depends kicad --remove kidiff kiauto && \
	curl https://codeload.github.com/INTI-CMNB/KiAuto/zip/refs/heads/master --output pp.zip && \
	unzip pp.zip && \
	pip3 install --break-system-packages KiAuto-master/ && \
	rm -rf KiAuto-master/ pp.zip  && \
	curl https://codeload.github.com/INTI-CMNB/KiDiff/zip/refs/heads/master --output pp.zip && \
	unzip pp.zip && \
	pip3 install --break-system-packages KiDiff-master/ && \
	rm -rf KiDiff-master/ pp.zip && \
	rm -rf /var/lib/apt/lists/*

# For some reason we don't have any locale, KiBoM needs them
RUN     apt-get update  && \
	apt-get install -y locales && \
	sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	locale-gen && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

