FROM setsoft/kicad_auto:latest
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest \
	                                           python3-pip python3-wheel python3-setuptools \
	                                           diffutils \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           xlsx2csv && \
	apt-get -y install pandoc texlive-latex-base texlive-latex-recommended texlive-fonts-recommended && \
	apt-get -y install -t buster-backports python3-coverage wget curl && \
	curl -s https://api.github.com/repos/set-soft/coveralls-python/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y remove wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

# KiBoM Python 2.7 test
RUN     apt-get update  && \
	apt-get -y install --no-install-recommends python-pytest python-xlsxwriter && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

