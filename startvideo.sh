#!/bin/bash
cd /home/pi/videostream
while :
do
rsync -a -P --delete --omit-dir-times rsync://192.168.0.247:873/mediafiles/ /home/pi/videostream
for file in $1*
do
omxplayer -b -o hdmi "$file" > /dev/null
done
done
