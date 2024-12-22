#!/bin/bash

# Define the card and sink
CARD="alsa_card.pci-0000_2b_00.4"
SINK="alsa_output.pci-0000_2b_00.4.analog-stereo"

# Check the current active port and switch
CURRENT_PORT=$(pactl list sinks | grep -A 15 "$SINK" | grep "Active Port" | awk '{print $3}')

if [ "$CURRENT_PORT" = "analog-output-lineout" ]; then
    # Switch to IEMs (Headphones)
    pactl set-card-profile $CARD pro-audio
    pactl set-sink-port $SINK analog-output-headphones
    echo "Switched to IEM (Headphones)"
else
    # Switch to Speakers
    pactl set-card-profile $CARD output:analog-stereo+input:analog-stereo
    pactl set-sink-port $SINK analog-output-lineout
    echo "Switched to Speakers"
fi
