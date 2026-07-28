#!/bin/bash

DIR="$HOME/Imágenes/Capturas"
mkdir -p "$DIR"

FILE="$DIR/$(date +%Y-%m-%d_%H-%M-%S).png"

grim -g "$(slurp)" "$FILE"

if [ -f "$FILE" ]; then
    wl-copy < "$FILE"
    notify-send "Captura guardada" "$(basename "$FILE")"
fi
