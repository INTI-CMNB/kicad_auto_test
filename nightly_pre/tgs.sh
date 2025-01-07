TG1=`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps cat /etc/debian_version | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad_auto_test:nightly_deps /bin/bash -c "ls -d /usr/bin/?.? | tr -d '\n' | tail -c 3"`
