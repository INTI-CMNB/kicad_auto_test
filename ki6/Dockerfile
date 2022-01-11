FROM setsoft/kicad_auto:ki6
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest    \
	                                           imagemagick librsvg2-bin ghostscript    \
	                                           diffutils git \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           xlsx2csv && \
	apt-get -y install python3-coverage wget curl && \
	curl -s https://api.github.com/repos/set-soft/coveralls-python/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y remove curl wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

# 8:6.9.10.23+dfsg-2.1+deb10u1 restricted ghostscript formats, but we need them
RUN     sed -i 's/<policy domain="coder" rights="none" pattern="PDF" \/>/<!-- <policy domain="coder" rights="none" pattern="PDF" \/> -->/g' /etc/ImageMagick-6/policy.xml && \
	sed -i 's/<policy domain="coder" rights="none" pattern="PS" \/>/<!-- <policy domain="coder" rights="none" pattern="PS" \/> -->/g' /etc/ImageMagick-6/policy.xml

