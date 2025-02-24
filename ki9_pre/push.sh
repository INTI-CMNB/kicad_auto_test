#!/bin/sh
set -e
. ./tgs.sh
docker push ghcr.io/inti-cmnb/kicad9_auto_full:${TG1}_${TG2}_${TG3}_deps
docker push ghcr.io/inti-cmnb/kicad9_auto_full:latest_deps

