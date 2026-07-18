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

    if [ ! -z "$FONDO" ]; then
        # Matamos el swaybg anterior para que no se acumulen procesos
        pkill swaybg

        # Aplicamos el nuevo fondo en todos los monitores usando el modo "fill" (rellenar)
        swaybg -i "$FONDO" -m fill &
    fi

    sleep $INTERVALO
done
