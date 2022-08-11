#!/bin/sh
./download.sh
docker build -f Dockerfile -t setsoft/kicad_auto_test:11.3-5.1.9 .
