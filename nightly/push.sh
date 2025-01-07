#!/bin/sh
set -e
. ./tgs.sh
docker push ghcr.io/inti-cmnb/kicad_auto_test:${TG1}_${TG2}_${TG3}_${TG4}
docker push ghcr.io/inti-cmnb/kicad_auto_test:nightly
