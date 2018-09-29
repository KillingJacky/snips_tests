#!/bin/bash

sudo systemctl stop snips-audio-server
sudo systemctl start snips-hotword
sudo systemctl stop snips-dialogue
sudo systemctl stop snips-asr

snips-audio-server --nomike --hijack 0.0.0.0:1234 &

echo "========================================"
echo "Now cat the 1 channel wav file into localhost:1234"
echo "eg cat 4mic-turn-on-the-bedroom-light-x5.wav | nc localhost 1234 "
echo "========================================"

python snips_wakeup_test.py


sudo killall arecord
sudo killall nc
sudo killall snips-audio-server


