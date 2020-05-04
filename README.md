# kicad_auto_test

This docker image is used to test the tools found in [kicad_auto](http://github.com/INTI-CMNB/kicad_auto).

Includes:

* python3-flake8
* python3-pytest
* imagemagick (+ghostscript)
* diffutils
* python3-coverage
* python-coveralls
* git

Notes:
* git is used by coveralls
* imagemagick and ghostscipt are used to compare images and PDFs on tests

