#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps .
. ./tgs.sh
docker tag ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps ghcr.io/inti-cmnb/kicad_auto_test:${TG1}_${TG2}_${TG3}_deps
