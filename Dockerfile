FROM setsoft/kicad_auto:latest
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiPlot and other automation scripts w/test tools"

COPY *.deb /
RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8 python3-pytest imagemagick ghostscript diffutils git x11-utils && \
	apt-get -y install python3-coverage && \
	apt -y install --no-install-recommends ./*.deb && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

