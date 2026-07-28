#!/bin/bash

# Esperar 2 segundos a que Hyprland y los monitores carguen por completo
sleep 2

# la ruta a la carpeta de fondos de pantalla
DIR="$HOME/.config/hypr/fondos"

# el tiempo en segundos para cambiar la imagen (300 segundos = 5 minutos)
INTERVALO=300

while true; do
    # para que se seleccione una imagen aleatoria
    FONDO=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" -o -name "*.webp" \) | shuf -n 1)

   if command -v hyprctl >/dev/null && pgrep hyprpaper >/dev/null; then
    hyprctl hyprpaper preload "$FONDO"
    hyprctl hyprpaper wallpaper ",$FONDO"
    hyprctl hyprpaper unload unused
elif command -v swaybg >/dev/null; then
    pkill swaybg
    swaybg -i "$FONDO" -m fill &
else
    echo "No se encontró ni hyprpaper ni swaybg."
fi


    sleep $INTERVALO
done
