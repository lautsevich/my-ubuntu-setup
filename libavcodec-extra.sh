#!/bin/bash

INSTALL_BULK=$1

if [[ "$INSTALL_BULK" = false ]]; then
    sudo apt-get update
fi

sudo apt install -y libavcodec-extra