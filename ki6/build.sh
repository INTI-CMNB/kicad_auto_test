#!/bin/sh
./download.sh
docker build -f Dockerfile -t setsoft/kicad_auto_test:ki6 .
