#!/bin/bash

sudo systemctl start snips-audio-server
sudo systemctl start snips-hotword
sudo systemctl stop snips-dialogue

python snips_wakeup_test.py


