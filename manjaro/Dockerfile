FROM setsoft/kicad_auto:manjaro_k6
MAINTAINER Salvador E. Tropea <set@ieee.org>
LABEL Description="KiCad with KiBot and other automation scripts w/test tools"

RUN     sudo pacman -S flake8 python-pytest python-pytest-xdist python-wheel diffutils fluxbox x11vnc wmctrl unzip zbar python-coverage wget --noconfirm && \
	sudo pacman -S --noconfirm  make python-pre-commit && \
	su builder -c "yay -S --noconfirm python-xlsx2csv"

