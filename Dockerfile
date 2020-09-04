FROM setsoft/kicad_auto:latest
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8 && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends python3-pytest && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN     apt-get update  && \
	apt-get -y install python3-coverage && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends imagemagick librsvg2-bin ghostscript && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends diffutils git && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends x11-utils fluxbox x11vnc wmctrl && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

COPY *.deb /
RUN     apt-get update  && \
	apt -y install --no-install-recommends ./*.deb && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

# 8:6.9.10.23+dfsg-2.1+deb10u1 restricted ghostscript formats, but we need them
RUN     sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<!-- <policy domain="coder" rights="none" pattern="PDF" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PS" \/>/<!-- <policy domain="coder" rights="none" pattern="PS" \/> -->/g' /etc/ImageMagick-6/policy.xml

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends unzip && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

# KiBoM Python 2.7 test
RUN     apt-get update  && \
	apt-get -y install --no-install-recommends python-pytest python-xlsxwriter && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

