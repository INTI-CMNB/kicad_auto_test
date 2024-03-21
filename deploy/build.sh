#!/bin/sh
set -e
# KiCad 6, tag the generic ki6 as latest and also for Docker Hub
docker pull ghcr.io/inti-cmnb/kicad_auto_test:ki6
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki6 setsoft/kicad_auto_test:ki6
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki6 ghcr.io/inti-cmnb/kicad6_auto_full:latest
docker push setsoft/kicad_auto_test:ki6
docker push ghcr.io/inti-cmnb/kicad6_auto_full:latest
# KiCad 7
docker pull ghcr.io/inti-cmnb/kicad_auto_test:ki7
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki7 setsoft/kicad_auto_test:ki7
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki7 ghcr.io/inti-cmnb/kicad7_auto_full:latest
docker push setsoft/kicad_auto_test:ki7
docker push ghcr.io/inti-cmnb/kicad7_auto_full:latest
# KiCad 8
docker pull ghcr.io/inti-cmnb/kicad_auto_test:ki8
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki8 setsoft/kicad_auto_test:ki8
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki8 ghcr.io/inti-cmnb/kicad8_auto_full:latest
docker push setsoft/kicad_auto_test:ki8
docker push ghcr.io/inti-cmnb/kicad8_auto_full:latest
# KiCad 5
docker pull ghcr.io/inti-cmnb/kicad_auto_test:ki5
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki5 setsoft/kicad_auto_test:latest
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki5 ghcr.io/inti-cmnb/kicad5_auto_full:latest
docker push setsoft/kicad_auto_test:latest
docker push ghcr.io/inti-cmnb/kicad5_auto_full:latest

