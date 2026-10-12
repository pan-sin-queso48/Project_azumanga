#!/bin/bash
CARPETA_IMAGENES="$HOME/.config/hypr/fastfetch_logos"
IMAGEN_ALEATORIA=$(find "$CARPETA_IMAGENES" -type f \( -name "*.png" -o -name "*.jpg" \) | shuf -n 1)
eww update imagen_banner="$IMAGEN_ALEATORIA"
eww open --toggle reproductor
