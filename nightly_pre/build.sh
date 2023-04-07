#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps kicad_version.py`
TG2=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps ghcr.io/inti-cmnb/kicad_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad_auto_full:nightly_deps
