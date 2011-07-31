#!/bin/bash

cat ArduinOPML.xml | perl -e 'while ($l = <>) { $e = ($l =~ /xmlUrl="([^"]+)"/g)[0]; print $e, "\n" if ($e) ;}' | sort -u > ArduinOPML.raw.txt
