#!/bin/sh
set -e
cp ../dl_deb.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad7_auto_full:latest_deps .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad7_debian:latest_full kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad7_debian:latest_full cat /etc/debian_version | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad7_debian:latest_full /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
docker tag ghcr.io/inti-cmnb/kicad7_auto_full:latest_deps ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad7_auto_full:latest_deps

