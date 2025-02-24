#!/bin/sh
set -e
. ../iteration.sh
docker build -f Dockerfile --build-arg iteration=${IT} -t ghcr.io/inti-cmnb/kicad9_auto_full:latest .
. ./tgs.sh
docker tag ghcr.io/inti-cmnb/kicad9_auto_full:latest ghcr.io/inti-cmnb/kicad9_auto_full:${TG1}-${IT}_${TG2}_${TG3}_${TG4}
docker tag ghcr.io/inti-cmnb/kicad9_auto_full:latest ghcr.io/inti-cmnb/kicad9_auto_full:${TG1}
docker tag ghcr.io/inti-cmnb/kicad9_auto_full:latest ghcr.io/inti-cmnb/kicad_auto_test:ki9
