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

You'll see the count of triggering in the previous terminal, like this

```
========================================
Now cat the 1 channel wav file into localhost:1234, for an example
cat your-single-channel-wave-file.wav | nc localhost 1234
========================================
Connected with result code 0
hermes/hotword/default/toggleOn {"siteId": "default"}
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 1 @ 111s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 2 @ 111s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 3 @ 121s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 4 @ 130s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 5 @ 150s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 6 @ 161s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 7 @ 171s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 8 @ 180s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 9 @ 190s
hermes/hotword/default/detected {"siteId":"default","modelId":"hey_snips","modelVersion":"hey_snips_3.1_2018-04-13T15:27:35_model_0019","modelType":"universal","currentSensitivity":0.5}
=> Trigger count: 10 @ 200s
```

## ASR Test

The test need a snips assistant deployed onto RPi，and this assistant will only listen on one intent - "turn on the bedroom light".

We input pre-recorded audio to snips-audio-server, and monitor the MQTT messages to count the times of the detection of this intent.


