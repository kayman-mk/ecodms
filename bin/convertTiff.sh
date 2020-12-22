#!/bin/sh

tiffcp *.tif /home/kayma/tmp/out.tiff
tiff2pdf /home/kayma/tmp/out.tiff -o /home/kayma/tmp/out.pdf

chown ecodms:ecodms /home/kayma/tmp/out.pdf
mv /home/kayma/tmp/out.pdf /opt/ecodms/workdir/scaninput/
