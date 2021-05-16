#!/bin/bash

VID=$1

OUTPUT=$(youtube-dl --get-filename \
 --no-call-home \
 -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' \
 -o '/home/youtube-dl/Downloads/%(title)s.mp4' \
 $VID)


[ -f "$OUTPUT" ] && echo "File exists" || youtube-dl \
 --no-call-home \
 -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' \
 -o '/home/youtube-dl/Downloads/%(title)s.mp4' \
 $VID

# notes:
# add feature to get format types
# youtube-dl -F url
# youtube-dl -f numberofformat url
