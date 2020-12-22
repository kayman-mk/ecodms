#!/bin/sh

rm /home/kayma/tmp/*

for f in *.jpg; do
  convert "$f" /home/kayma/tmp/"$f.pdf"
done

pdfunite /home/kayma/tmp/*.pdf tmp/archive.pdf

chown ecodms:ecodms /home/kayma/tmp/archive.pdf

mv /home/kayma/tmp/archive.pdf /opt/ecodms/scaninput/
