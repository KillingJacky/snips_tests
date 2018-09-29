
## ASR Test

The test need a snips assistant deployed onto RPi，and this assistant will only listen on one intent - "turn on the bedroom light".

We input pre-recorded audio to snips-audio-server, and monitor the MQTT messages to count the times of the detection of this intent.


