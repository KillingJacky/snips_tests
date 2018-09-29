#!/bin/bash

mosquitto_sub -h localhost -t "hermes/hotword/#" -t "hermes/asr/#" -t "hermes/nlu/#" -v