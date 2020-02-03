#!/bin/bash

VID=$1

OUTPUT=$(youtube-dl --get-filename \
 --no-call-home \
 --extract-audio \
 --audio-format mp3 \
 -o '/home/youtube-dl/Downloads/%(title)s.mp3' \
 $VID)


[ -f "$OUTPUT" ] && echo "File exists" || youtube-dl --extract-audio \
 --no-call-home \
 --audio-format mp3 \
 -o '/home/youtube-dl/Downloads/%(title)s.%(ext)s' \
 $VID

