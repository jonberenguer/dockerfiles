#!/bin/bash

VID=$1

OUTPUT=$(youtube-dl --get-filename \
 --no-call-home \
 -o '/home/youtube-dl/Downloads/%(title)s.mp4' \
 $VID)


[ -f "$OUTPUT" ] && echo "File exists" || youtube-dl \
 --no-call-home \
 -o '/home/youtube-dl/Downloads/%(title)s.mp4' \
 $VID

