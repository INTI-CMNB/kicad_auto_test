TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?\) .*/\1/' | tr -d '\n'`
TG2=k`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly kicad_version.py`
TG3=d`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly cat /etc/debian_version | tr -d '\n'`
TG4=b`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
