#!/bin/bash


TYPE=$1
VID="batch-list.txt"



case "$1" in
	"audio")
youtube-dl --extract-audio \
 --no-call-home \
 --audio-format mp3 \
 -o '/home/youtube-dl/Downloads/%(title)s.%(ext)s' \
  -a /home/youtube-dl/Downloads/$VID
		;;
	"video")
youtube-dl \
 --no-call-home \
 -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' \
 -o '/home/youtube-dl/Downloads/%(title)s.mp4' \
  -a /home/youtube-dl/Downloads/$VID
		;;
	*)  echo "no selection" ; exit 0 ;;
esac
