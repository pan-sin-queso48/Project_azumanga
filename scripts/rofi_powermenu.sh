#!/bin/bash

IMG_DIR="$HOME/.config/rofi/images/azumanga"
TARGET="$HOME/.config/rofi/images/current.png"
RANDOM_IMG=$(find "$IMG_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) 2>/dev/null | shuf -n 1)

THEME_EXTRA=""
if [ -n "$RANDOM_IMG" ]; then
    ln -sf "$RANDOM_IMG" "$TARGET"
    MENU_HEIGHT=380
    RIGHT_PANEL_WIDTH=420 # Espacio suficiente para que el texto no se corte

    READ_DIM=$(identify -format "%w %h" "$RANDOM_IMG" 2>/dev/null)
    IMG_W=$(echo "$READ_DIM" | awk '{print $1}')
    IMG_H=$(echo "$READ_DIM" | awk '{print $2}')

    if [ -n "$IMG_W" ] && [ -n "$IMG_H" ] && [ "$IMG_H" -gt 0 ]; then
        CALC_W=$(( (MENU_HEIGHT * IMG_W) / IMG_H ))
        TOTAL_W=$(( CALC_W + RIGHT_PANEL_WIDTH ))
        THEME_EXTRA="window { width: ${TOTAL_W}px; } image-container { width: ${CALC_W}px; }"
    fi
fi

op_lock="🔒 Bloquear"
op_suspend="🌙 Suspender"
op_logout="🚪 Cerrar Sesión"
op_reboot="🔄 Reiniciar"
op_shutdown="🛑 Apagar"

OPTIONS="$op_lock\n$op_suspend\n$op_logout\n$op_reboot\n$op_shutdown"

CHOSEN=$(echo -e "$OPTIONS" | rofi -dmenu \
    -p "🌸 Powermenu" \
    -theme ~/.config/rofi/config.rasi \
    -theme-str "$THEME_EXTRA" \
    -i)

case "$CHOSEN" in
    *"Bloquear"*)
        hyprlock || swaylock
        ;;
    *"Suspender"*)
        systemctl suspend
        ;;
    *"Cerrar Sesión"*)
        hyprctl dispatch exit
        ;;
    *"Reiniciar"*)
        systemctl reboot
        ;;
    *"Apagar"*)
        systemctl poweroff
        ;;
esac
