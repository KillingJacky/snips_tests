#!/bin/bash

sudo systemctl start snips-audio-server
sudo systemctl start snips-hotword
sudo systemctl stop snips-dialogue
sudo systemctl stop snips-asr

python snips_wakeup_test.py


