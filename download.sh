#!/bin/sh
rm *.deb
#curl -s https://api.github.com/repos/set-soft/docopt/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i -
curl -s https://api.github.com/repos/set-soft/coveralls-python/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -i -

