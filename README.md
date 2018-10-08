## Prepare

Follow the instructions here to finish the installation for Raspberry Pi.
https://snips.gitbook.io/documentation/installing-snips/on-a-raspberry-pi

```
$ sudo pip install -r requirements.txt
```

## Wakeup Test

We can do offline testing with snips-audio-server's hijack feature. In this case we can use a pre-recorded audio file to test the performance of snips-hotword component.

```
$ ./snips_wakeup_test_with_file.sh
```

Then in another terminal

```
$ cat your-single-channel-wave-file.wav | nc localhost 1234
```

You'll see the count of triggering in the previous terminal.

## ASR Test

The test need a snips assistant deployed onto RPi，and this assistant will only listen on one intent - "turn on the bedroom light".

We input pre-recorded audio to snips-audio-server, and monitor the MQTT messages to count the times of the detection of this intent.


