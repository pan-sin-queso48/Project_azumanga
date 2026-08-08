#!/bin/bash

IMG_DIR="$HOME/.config/rofi/images/azumanga"
TARGET="$HOME/.config/rofi/images/current.png"

RANDOM_IMG=$(find "$IMG_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) 2>/dev/null | shuf -n 1)

if [ -n "$RANDOM_IMG" ]; then
    ln -sf "$RANDOM_IMG" "$TARGET"

    # Alto de la ventana de Rofi (aproximado)
    MENU_HEIGHT=380
    RIGHT_PANEL_WIDTH=400 # Ancho fijo para la lista de aplicaciones

    # Medir dimensiones de la imagen
    READ_DIM=$(identify -format "%w %h" "$RANDOM_IMG" 2>/dev/null)
    IMG_W=$(echo "$READ_DIM" | awk '{print $1}')
    IMG_H=$(echo "$READ_DIM" | awk '{print $2}')

    if [ -n "$IMG_W" ] && [ -n "$IMG_H" ] && [ "$IMG_H" -gt 0 ]; then
        # Calcular ancho proporcional de la imagen
        CALC_W=$(( (MENU_HEIGHT * IMG_W) / IMG_H ))
        TOTAL_W=$(( CALC_W + RIGHT_PANEL_WIDTH ))

        # Inyectar dimensiones exactas a Rofi
        rofi -show drun -theme ~/.config/rofi/config.rasi \
             -theme-str "window { width: ${TOTAL_W}px; } image-container { width: ${CALC_W}px; }"
        exit 0
    fi
fi

rofi -show drun -theme ~/.config/rofi/config.rasi
