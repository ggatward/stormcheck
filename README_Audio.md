Audio files are generated from  https://freetools.textmagic.com/text-to-speech
    Voice: English (Australia) - Sabrina  Speed: 1x

The output MP3 is then converted to 8000Hz mono WAV using ffmpeg:

```
for infile in $(ls *.mp3 | cut -f1 -d.); do
    echo $infile.wav
    ffmpeg -y -i $infile.mp3 -ar 8000 -ac 1 $infile.wav
done
```

The resultant WAV files are copied to the IRLP custom audio directory for use by the stormcheck script.
