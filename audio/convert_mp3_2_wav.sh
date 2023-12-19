#!/bin/bash

for infile in $(ls *.mp3 | cut -f1 -d.); do
    echo $infile.wav
    ffmpeg -y -i $infile.mp3 -ar 8000 -ac 1 $infile.wav
done
