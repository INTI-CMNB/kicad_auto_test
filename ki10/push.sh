#!/bin/sh
set -e
. ../iteration.sh
. ./tgs.sh
docker push ghcr.io/inti-cmnb/kicad10_auto_full:${TG1}-${IT}_${TG2}_${TG3}_${TG4}
docker push ghcr.io/inti-cmnb/kicad10_auto_full:${TG1}
docker push ghcr.io/inti-cmnb/kicad_auto_test:ki10

# Leave the following for the deploy:
#docker tag ghcr.io/inti-cmnb/kicad10_auto_full:latest setsoft/kicad_auto_test:ki10
#docker push ghcr.io/inti-cmnb/kicad10_auto_full:latest
#docker push setsoft/kicad_auto_test:ki10

