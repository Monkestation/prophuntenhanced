#!/bin/bash

wav_files=$(find . -name "*.wav")

for wav_file in $wav_files; do
    basename=$(basename "$wav_file")
    new_ogg_file="${basename}_converted.ogg"

    ffmpeg -i "$wav_file" -ar 44100 -ac 2 "$new_ogg_file"

    mv "$new_ogg_file" "${wav_file%.wav}.ogg"
	rm $wav_file
done