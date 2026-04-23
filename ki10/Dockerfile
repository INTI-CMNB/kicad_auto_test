FROM ghcr.io/inti-cmnb/kicad10_auto_full:latest_deps
LABEL Maintainer="Salvador E. Tropea <set@ieee.org>"
LABEL Description="KiCad 10 w/KiBot and other automation scripts (full)"
LABEL org.opencontainers.image.description="KiCad 10 w/KiBot and other automation scripts (full)"

# Install all the tools, dependencies are already installed
RUN     apt-get update  && \
	dl_deb.py INTI-CMNB/KiBoM && \
	dl_deb.py INTI-CMNB/kicad-git-filters && \
	dl_deb.py set-soft/kicost-digikey-api-v3 && \
	dl_deb.py hildogjr/KiCost && \
	dl_deb.py INTI-CMNB/InteractiveHtmlBom && \
	dl_deb.py INTI-CMNB/KiKit --skip kikit-doc && \
	dl_deb.py INTI-CMNB/KiAuto && \
	dl_deb.py INTI-CMNB/kidiff && \
	dl_deb.py INTI-CMNB/KiBot && \
	dpkg -i kicad-git*.deb && \
	dpkg -i kibom*.deb && \
	dpkg -i interactivehtmlbom*.deb && \
	dpkg -i kicost-digi*.deb && \
	dpkg -i kicost_*.deb && \
	dpkg -i python3-pymeta*.deb python3-pybars*.deb kikit*.deb && \
	dpkg -i kiauto_*.deb && \
	dpkg -i kidiff_*.deb && \
	dpkg -i kibot_*.deb && \
	rm /*.deb && \
	rm -rf /var/lib/apt/lists/* /var/cache/debconf/templates.dat-old /var/lib/dpkg/status-old

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

# Install KiBot, KiAuto and KiDiff from repos
RUN     dpkg --remove kibot && \
	apt-get update && \
	apt-get -y install --no-install-recommends python3-setuptools && \
	curl https://codeload.github.com/INTI-CMNB/KiBot/zip/refs/heads/dev --output pp.zip && \
	unzip pp.zip && \
	curl https://codeload.github.com/yaqwsx/PcbDraw-Lib/zip/refs/heads/master --output pp2.zip && \
	unzip pp2.zip -d KiBot-dev/kibot/resources/pcbdraw/ && \
	rmdir KiBot-dev/kibot/resources/pcbdraw/footprints && \
	mv KiBot-dev/kibot/resources/pcbdraw/PcbDraw-Lib-master KiBot-dev/kibot/resources/pcbdraw/footprints && \
	pip3 install --break-system-packages --no-compile KiBot-dev/ && \
	rm -rf KiBot-dev pp.zip pp2.zip && \
	rm -rf /var/lib/apt/lists/*

