#!/bin/sh
docker run --rm -it --workdir=/work --volume=`pwd`:/work:rw ghcr.io/inti-cmnb/kicad_auto_test:ki8 /bin/bash
