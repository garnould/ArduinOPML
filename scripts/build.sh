#!/bin/bash

cat ArduinOPML.opml | perl -e 'while ($l = <>) { $e = ($l =~ /xmlUrl="([^"]+)"/g)[0]; print $e, "\n" if ($e) ;}' | sort -u > ArduinOPML.raw.txt

cat .README.header > README.md
./scripts/opml2readme.pl >> README.md
