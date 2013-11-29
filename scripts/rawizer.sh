#!/bin/bash

cat ArduinOPML.opml | perl -e 'while ($l = <>) { $e = ($l =~ /xmlUrl="([^"]+)"/g)[0]; print $e, "\n" if ($e) ;}' | sort -u > ArduinOPML.raw.txt

cat ArduinOPML.opml  | perl -ple 's/htmlUrl="([^"]+)"/htmlUrl="$1?utm_source=ArduinOPML&utm_campaign=Please_contribute_on_ArduinOPML&utm_medium=RSS"/g' > ArduinOPML.opml-new

echo "Think about utm_ !"
