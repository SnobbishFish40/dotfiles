#!/bin/bash

MAX_LEN=20

song_name=$(playerctl metadata --format "{{ title }}" --player=$1)
status=$(playerctl status --player=$1)

# Truncate
if [ ${#song_name} -gt $MAX_LEN ]; then
    display_text="${song_name:0:$MAX_LEN}..."
elif [ ${#song_name} -gt 0 ]; then
    display_text="$song_name"
else
  display_text="󰽳" 
fi

# Icon
if [[ "$status" == "Playing" ]]; then
  icon="󰏤 "
elif [[ "$status" == "Paused" ]]; then
  icon=" "
else
  icon=""
fi

echo "$display_text $icon"
