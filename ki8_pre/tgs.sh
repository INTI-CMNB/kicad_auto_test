TG1=`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps kicad_version.py`
TG2=d`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps cat /etc/debian_version | tr -d '\n'`
TG3=b`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest_deps /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
