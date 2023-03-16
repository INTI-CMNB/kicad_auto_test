#!/bin/sh
# KiCad 6, tag the generic ki6 as latest and also for Docker Hub
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki6 setsoft/kicad_auto_test:ki6
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki6 ghcr.io/inti-cmnb/kicad6_auto_full:latest
docker push setsoft/kicad_auto_test:ki6
docker push ghcr.io/inti-cmnb/kicad6_auto_full:latest
# KiCad 7
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki7 setsoft/kicad_auto_test:ki7
docker tag ghcr.io/inti-cmnb/kicad_auto_test:ki7 ghcr.io/inti-cmnb/kicad7_auto_full:latest
docker push setsoft/kicad_auto_test:ki7
docker push ghcr.io/inti-cmnb/kicad7_auto_full:latest
# KiCad 5
docker tag ghcr.io/inti-cmnb/kicad_auto_test:latest setsoft/kicad_auto_test:latest
docker tag ghcr.io/inti-cmnb/kicad_auto_test:latest ghcr.io/inti-cmnb/kicad5_auto_full:latest
docker push setsoft/kicad_auto_test:latest
docker push ghcr.io/inti-cmnb/kicad5_auto_full:latest

