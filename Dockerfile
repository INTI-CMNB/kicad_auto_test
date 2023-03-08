FROM setsoft/kicad_auto:latest
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest python3-pytest-xdist \
	                                           python3-pip python3-wheel python3-setuptools \
	                                           python3-markdown2 \
	                                           diffutils \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           xlsx2csv && \
	apt-get -y install pandoc texlive-latex-base texlive-latex-recommended && \
	apt-get -y install python3-coverage wget curl && \
	dl_deb.py set-soft/coveralls-python && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y remove wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

