#!/bin/bash

sudo systemctl start snips-audio-server
sudo systemctl start snips-asr
sudo systemctl stop snips-dialogue
sudo systemctl stop snips-hotword

python snips_asr_test.py


