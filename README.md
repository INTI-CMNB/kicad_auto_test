# kicad_auto_test

This docker image is used to test the tools found in [kicad_auto](http://github.com/INTI-CMNB/kicad_auto).
The images are uploaded to Docker Hub [setsoft/kicad_auto_test](https://hub.docker.com/repository/docker/setsoft/kicad_auto_test) and
the Git Hub packages: [kicad5_auto_full](https://github.com/INTI-CMNB/kicad_auto_test/pkgs/container/kicad5_auto_full) and
[kicad6_auto_full](https://github.com/INTI-CMNB/kicad_auto_test/pkgs/container/kicad6_auto_full).

Includes:

* python3-flake8
* python3-pytest (+python-pytest)
* imagemagick (+ghostscript +librsvg2-bin)
* diffutils
* python3-coverage
* python-coveralls
* x11-utils
* unzip
* zbar-tools
* procps
* xlsx2csv
* pandoc (+texlive-latex-base and texlive-latex-recommended)
* curl
* blender + pcb2blender (ki6 images)

Notes:
* git is used by coveralls
* imagemagick and ghostscipt are used to compare images and PDFs on tests
* librsvg2-bin is used to add SVG support to imagemagick
* x11-utils provides xprop
* pandoc can convert markdown to PDF (for KiBot reports)
