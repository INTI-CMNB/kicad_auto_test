TG1=`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest kibot --version | sed 's/.* \([0-9]\+\.[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?\) .*/\1/' | tr -d '\n'`
TG2=k`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest kicad_version.py`
TG3=d`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest cat /etc/debian_version | tr -d '\n'`
TG4=b`docker run --rm ghcr.io/inti-cmnb/kicad8_auto_full:latest /bin/bash -c "blender --version | head -n 1 | tr -d 'Blender '"`
