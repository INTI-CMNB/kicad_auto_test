# kicad_auto_test

Docker image for KiCad automation scripts suitable for CI/CD

The images from this project contains the full set of tools used by [KiBot](http://github.com/INTI-CMNB/KiBot).
They are used for general purpose and to test KiBot.

The images are uploaded to Docker Hub [setsoft/kicad_auto_test](https://hub.docker.com/repository/docker/setsoft/kicad_auto_test) and
the Git Hub packages: [kicad5_auto_full](https://github.com/INTI-CMNB/kicad_auto_test/pkgs/container/kicad5_auto_full),
[kicad6_auto_full](https://github.com/INTI-CMNB/kicad_auto_test/pkgs/container/kicad6_auto_full) and
[kicad7_auto_full](https://github.com/INTI-CMNB/kicad_auto_test/pkgs/container/kicad7_auto_full).

They use the [kicad_debian](http://github.com/INTI-CMNB/kicad_debian) images as base.
You can find a light way version of these images at [kicad_auto](http://github.com/INTI-CMNB/kicad_auto),
look there to know which tools are included and available tags.

The relation between the packages that contains the images is as depicted in the following image:

![Layers](Layers.png)

Extra tools included:

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
* curl
* pandoc (+texlive-latex-base and texlive-latex-recommended)
* blender + pcb2blender (ki6/7 images)

Notes:
* pandoc + LaTeX can convert markdown to PDF (for KiBot reports)
* Blender can do impressive renders of the boards
