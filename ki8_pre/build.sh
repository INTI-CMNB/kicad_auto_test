#!/bin/sh
set -e
docker build -f Dockerfile -t ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps .
. ./tgs.sh
docker tag ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps ghcr.io/inti-cmnb/kicad8_auto_full:${TG1}_${TG2}_${TG3}_deps
