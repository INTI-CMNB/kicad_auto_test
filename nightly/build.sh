#!/bin/sh
set -e
cp ../enable_pcb2blender.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad_auto_full:nightly .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\) .*/\1/' | tr -d '\n'`
TG2=k`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly kicad_version.py`
TG3=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly /bin/bash -c "grep DISTRIB_CODENAME /etc/lsb-release | sed  s/DISTRIB_CODENAME=//" | tr -d '\n'`
TG4=b`docker run --rm ghcr.io/inti-cmnb/kicad_auto_full:nightly /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/kicad_auto_full:nightly ghcr.io/inti-cmnb/kicad_auto_full:${TG1}_${TG2}_${TG3}_${TG4}
docker push ghcr.io/inti-cmnb/kicad_auto_full:${TG1}_${TG2}_${TG3}_${TG4}
docker push ghcr.io/inti-cmnb/kicad_auto_full:nightly

