FROM setsoft/kicad_auto:ki6
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     apt-get update  && \
	apt-get -y install --no-install-recommends flake8    \
	                                           python3-pytest    \
	                                           python3-pip python3-wheel python3-setuptools \
	                                           diffutils \
	                                           x11-utils fluxbox x11vnc wmctrl \
	                                           unzip \
	                                           zbar-tools \
	                                           procps \
	                                           xlsx2csv && \
	apt-get -y install pandoc texlive-latex-base texlive-latex-recommended && \
	apt-get -y install -t bullseye-backports curl && \
	apt-get -y install python3-coverage wget && \
	curl -s https://api.github.com/repos/set-soft/coveralls-python/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y remove curl wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*

