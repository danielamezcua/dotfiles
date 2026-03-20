#!/bin/bash
# Pipe cava output as Unicode bar characters for waybar

bars=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

config="/tmp/cava-waybar.conf"
cat > "$config" <<CAVAEOF
[general]
bars = 8
framerate = 30
sensitivity = 100

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
CAVAEOF

cava -p "$config" 2>/dev/null | while IFS= read -r line; do
    IFS=';' read -ra levels <<< "$line"
    output=""
    for level in "${levels[@]}"; do
        [[ -z "$level" ]] && continue
        output+="${bars[$level]}"
    done
    [[ -n "$output" ]] && echo "{\"text\": \"$output\"}"
done
