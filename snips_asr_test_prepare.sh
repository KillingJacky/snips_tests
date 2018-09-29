#!/bin/bash

sudo rm -rf /usr/share/snips/assistant/

sudo unzip assistant_proj_8Vkmxzbx2rZq.zip -d /usr/share/snips/

sudo systemctl restart 'snips-*'