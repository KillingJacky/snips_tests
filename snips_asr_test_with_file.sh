#!/bin/bash

sudo systemctl stop snips-audio-server
sudo systemctl start snips-asr
sudo systemctl stop snips-dialogue
sudo systemctl stop snips-hotword

snips-audio-server --nomike --hijack 0.0.0.0:1234 &
# arecord -r 16000 -c 4 -f S16_LE | nc localhost 1234 &

echo "========================================"
echo "Now cat the 1 channel wav file into localhost:1234, for an example"
echo "cat your-single-channel-wave-file.wav | nc localhost 1234 "
echo "========================================"

python snips_asr_test.py

sudo killall arecord
sudo killall nc
sudo killall snips-audio-server
