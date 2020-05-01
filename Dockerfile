FROM setsoft/kicad_auto:latest
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiPlot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8 python3-pytest imagemagick ghostscript diffutils && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

