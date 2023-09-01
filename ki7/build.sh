#!/bin/sh
set -e
cp ../enable_pcb2blender.py .
cp ../pcb2blender-1.patch .
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad7_auto_full:latest .
IT=1
TG1=`docker run --rm ghcr.io/inti-cmnb/kicad7_auto_full:latest kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\) .*/\1/' | tr -d '\n'`
TG2=k`docker run --rm ghcr.io/inti-cmnb/kicad7_auto_full:latest kicad_version.py`
TG3=d`docker run --rm ghcr.io/inti-cmnb/kicad7_auto_full:latest cat /etc/debian_version | tr -d '\n'`
TG4=b`docker run --rm ghcr.io/inti-cmnb/kicad7_auto_full:latest /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
docker tag ghcr.io/inti-cmnb/kicad7_auto_full:latest ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}-${IT}_${TG2}_${TG3}_${TG4}
docker tag ghcr.io/inti-cmnb/kicad7_auto_full:latest ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}
docker tag ghcr.io/inti-cmnb/kicad7_auto_full:latest ghcr.io/inti-cmnb/kicad_auto_test:ki7
docker push ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}-${IT}_${TG2}_${TG3}_${TG4}
docker push ghcr.io/inti-cmnb/kicad7_auto_full:${TG1}
docker push ghcr.io/inti-cmnb/kicad_auto_test:ki7

# Leave the following for the deploy:
#docker tag ghcr.io/inti-cmnb/kicad7_auto_full:latest setsoft/kicad_auto_test:ki7
#docker push ghcr.io/inti-cmnb/kicad7_auto_full:latest
#docker push setsoft/kicad_auto_test:ki7

