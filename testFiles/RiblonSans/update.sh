#!/bin/bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -rf RiblonSans.ufo
rm -f RiblonSans.ufo.zip
rm -rf master_ufo

fontmake -g ./RiblonSans.glyphs -o ufo

mv master_ufo/newFont-Regular.ufo RiblonSans.ufo
zip -r RiblonSans.ufo.zip RiblonSans.ufo
rm -r master_ufo
