#!/bin/sh
set -e
cp ../dl_deb.py .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps cat /etc/debian_version | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker tag ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps ghcr.io/inti-cmnb/kicad6_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad6_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad6_auto_full:latest_deps

