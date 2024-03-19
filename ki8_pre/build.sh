#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps .
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps kicad_version.py`
TG2=d_sid
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker tag ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps ghcr.io/inti-cmnb/kicad8_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad8_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps

