#!/bin/bash

IMG_DIR="$HOME/.config/rofi/images/azumanga"
TARGET="$HOME/.config/rofi/images/current.png"
RANDOM_IMG=$(find "$IMG_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) 2>/dev/null | shuf -n 1)

THEME_EXTRA=""
if [ -n "$RANDOM_IMG" ]; then
    ln -sf "$RANDOM_IMG" "$TARGET"
    MENU_HEIGHT=380
    RIGHT_PANEL_WIDTH=420

    READ_DIM=$(identify -format "%w %h" "$RANDOM_IMG" 2>/dev/null)
    IMG_W=$(echo "$READ_DIM" | awk '{print $1}')
    IMG_H=$(echo "$READ_DIM" | awk '{print $2}')

    if [ -n "$IMG_W" ] && [ -n "$IMG_H" ] && [ "$IMG_H" -gt 0 ]; then
        CALC_W=$(( (MENU_HEIGHT * IMG_W) / IMG_H ))
        TOTAL_W=$(( CALC_W + RIGHT_PANEL_WIDTH ))
        THEME_EXTRA="window { width: ${TOTAL_W}px; } image-container { width: ${CALC_W}px; }"
    fi
fi

STATUS=$(playerctl status 2>/dev/null || echo "Stopped")
ARTIST=$(playerctl metadata artist 2>/dev/null || echo "YouTube Music")
TITLE=$(playerctl metadata title 2>/dev/null || echo "Sin reproducción activa")

if [ "$STATUS" = "Playing" ]; then
    PLAY_ICON="⏸️ Pausar"
    INFO_TEXT="▶️ $ARTIST - $TITLE"
elif [ "$STATUS" = "Paused" ]; then
    PLAY_ICON="▶️ Reanudar"
    INFO_TEXT="⏸️ $ARTIST - $TITLE"
else
    PLAY_ICON="▶️ Iniciar Radio / Playlist"
    INFO_TEXT="󰎈 mpv detenido"
fi

MENU_OPTIONS="$PLAY_ICON\n⏭️ Siguiente Canción\n⏮️ Anterior Canción\n🛑 Detener mpv\n🔊 Subir Volumen (+10%)\n🔉 Bajar Volumen (-10%)"

CHOSEN=$(echo -e "$MENU_OPTIONS" | rofi -dmenu \
    -p "🌸 Azumanga Radio" \
    -mesg "$INFO_TEXT" \
    -theme ~/.config/rofi/config.rasi \
    -theme-str "$THEME_EXTRA" \
    -i)

case "$CHOSEN" in
    *"Pausar"*|*"Reanudar"*) playerctl play-pause ;;
    *"Iniciar Radio"*) pkill -f "mpv" 2>/dev/null; ~/.local/bin/mt.sh >/dev/null 2>&1 & ;;
    *"Siguiente"*) playerctl next ;;
    *"Anterior"*) playerctl previous ;;
    *"Detener"*) pkill -f "mpv" ;;
    *"Subir Volumen"*) playerctl volume 0.10+ ;;
    *"Bajar Volumen"*) playerctl volume 0.10- ;;
esac
