#!/usr/bin/env python

import json
import paho.mqtt.client as mqtt

class UserData(object):
    def __init__(self):
        self.trigger_cnt = 0
    def triggered(self):
        self.trigger_cnt += 1

ud = UserData()

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    topics = [("hermes/intent/#", 0), ("hermes/hotword/#", 0), ("hermes/asr/#", 0), ("hermes/nlu/#", 0), ("snipsmanager/#", 0)]
    client.subscribe(topics)

    client.publish('hermes/hotword/default/toggleOn', json.dumps({'siteId': 'default'}))

def on_message(client, userdata, msg):
    print(msg.topic+" "+str(msg.payload))
    if msg.topic == "hermes/hotword/default/detected":
        userdata.triggered()
        print('=> Trigger count: {}'.format(userdata.trigger_cnt))

client = mqtt.Client(userdata=ud)
client.on_connect = on_connect
client.on_message = on_message

client.connect("127.0.0.1", 1883, 60)

client.loop_forever()

