FROM setsoft/kicad_auto:ki6
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
	apt-get -y install -t bullseye-backports curl && \
	apt-get -y install python3-coverage wget && \
	curl -s https://api.github.com/repos/set-soft/coveralls-python/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i - && \
	apt -y install --no-install-recommends ./*.deb && \
	rm *.deb && \
	apt-get -y remove wget && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*
# Install Blender
RUN     apt-get -y update && \
	apt-get -y install --no-install-recommends xz-utils wget && \
	wget https://mirrors.ocf.berkeley.edu/blender/release/Blender3.4/blender-3.4.1-linux-x64.tar.xz && \
	tar xvf blender-3.4.1-linux-x64.tar.xz --strip-components=1 -C /usr/bin/ && \
	rm blender-3.4.1-linux-x64.tar.xz && \
	apt-get -y remove wget xz-utils && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*
# Install plug-in deps: pillow and skia-python (pip, numpy, etc.)
RUN     curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
	/usr/bin/3.4/python/bin/python3.10 get-pip.py && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install numpy==1.23.1 && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install pillow && \
	/usr/bin/3.4/python/bin/python3.10 -m pip install skia-python && \
	rm get-pip.py
# Install the plug-in
COPY  enable_pcb2blender.py /usr/bin/
RUN     curl -L https://github.com/30350n/pcb2blender/releases/download/v2.1-k6.0-b3.4/pcb2blender_importer_2-1.zip -o pcb2blender_importer_2-1.zip && \
	blender --background --python /usr/bin/enable_pcb2blender.py && \
	rm pcb2blender_importer_2-1.zip
