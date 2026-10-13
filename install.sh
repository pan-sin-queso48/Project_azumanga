#!/usr/bin/env bash

# ==========================================
#   Project_azumanga - Installation Script
# ==========================================

set -e

#colores
BOLD="\033[1m"
GREEN="\033[32m"
BLUE="\033[34m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

#directorios de destinos
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME/.config"
HYPR_DIR="$CONFIG_DIR/hypr"
BIN_DIR="$HOME/.local/bin"
BACKUP_DIR="$HOME/.config_backup_azumanga_$(date +%Y%m%d_%H%M%S)"

echo -e "${BOLD}${BLUE}===========================================${RESET}"
echo -e "${BOLD}${BLUE}    Iniciando instalación de Project_azumanga ${RESET}"
echo -e "${BOLD}${BLUE}===========================================${RESET}\n"

#comprobar que no se ejecute con sudo directamente
if [ "$EUID" -eq 0 ]; then
    echo -e "${RED}[ERROR] No ejecutes este script como root o con sudo. Corre solo: ./install.sh${RESET}"
    exit 1
fi

#instalación de dependencias (Pacman + AUR)
echo -e "${YELLOW}[1/6] Instalando dependencias desde repositorios oficiales con pacman...${RESET}"

#dependencias oficiales de arch
PACMAN_DEPS=(
    hyprpaper
    fastfetch
    grim
    slurp
    swaync
    waybar
    noto-fonts-emoji
    noto-fonts-cjk
    bash
    findutils
    coreutils
    imagemagick
    mpv
    yt-dlp
    playerctl
    wl-clipboard
)

sudo pacman -S --needed --noconfirm "${PACMAN_DEPS[@]}"

echo -e "\n${YELLOW}[2/6] Verificando helper de AUR para instalar EWW, Zen Browser y mpv-mpris...${RESET}"
if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
else
    echo -e "  -> No se encontró yay/paru. Instalando yay de forma temporal..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    AUR_HELPER="yay"
fi

echo -e "  -> Instalando paquetes de AUR..."
$AUR_HELPER -S --needed --noconfirm eww zen-browser-bin mpv-mpris

#copia de seguridad
echo -e "\n${YELLOW}[3/6] Creando copia de seguridad en $BACKUP_DIR...${RESET}"
mkdir -p "$BACKUP_DIR"
[ -d "$HYPR_DIR" ] && mv "$HYPR_DIR" "$BACKUP_DIR/"
for folder in fastfetch kitty rofi swaync waybar; do
    [ -d "$CONFIG_DIR/$folder" ] && mv "$CONFIG_DIR/$folder" "$BACKUP_DIR/"
done

#instalación de archivos a ~/.config y ~/.config/hypr
echo -e "\n${YELLOW}[4/6] Desplegando archivos del proyecto...${RESET}"
mkdir -p "$CONFIG_DIR" "$HYPR_DIR" "$BIN_DIR"

#carpetas a ~/.config
RED_FOLDERS=("fastfetch" "kitty" "rofi" "swaync" "waybar")
for folder in "${RED_FOLDERS[@]}"; do
    if [ -d "$REPO_DIR/$folder" ]; then
        cp -rf "$REPO_DIR/$folder" "$CONFIG_DIR/"
        echo -e "  -> Carpeta '$folder' copiada a ~/.config/"
    fi
done

#elementos a ~/.config/hypr/
BLUE_ITEMS=("backup" "conf.d" "fastfetch_logos" "fondos" "scripts" "cambiar_fondo.sh" "hyprland.conf" "osaka.jpg")
for item in "${BLUE_ITEMS[@]}"; do
    if [ -e "$REPO_DIR/$item" ]; then
        cp -rf "$REPO_DIR/$item" "$HYPR_DIR/"
        echo -e "  -> Elemento '$item' copiado a ~/.config/hypr/"
    fi
done

#archivo .bashrc a ~/
if [ -f "$REPO_DIR/.bashrc" ]; then
    [ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$BACKUP_DIR/.bashrc.bak"
    cp -f "$REPO_DIR/.bashrc" "$HOME_DIR/.bashrc"
    echo -e "  -> Archivo .bashrc copiado a $HOME/"
fi

#mover scripts especiales a ~/.local/bin
echo -e "\n${YELLOW}[5/6] Moviendo scripts de MPV a ~/.local/bin y otorgando permisos...${RESET}"
YELLOW_SCRIPTS=("algo.sh" "azu.sh" "playlist.sh")

for script in "${YELLOW_SCRIPTS[@]}"; do
    if [ -f "$REPO_DIR/scripts/$script" ]; then
        cp -f "$REPO_DIR/scripts/$script" "$BIN_DIR/"
        chmod +x "$BIN_DIR/$script"
        echo -e "  -> Script '$script' instalado en ~/.local/bin/ como ejecutable"
    fi
done

#permisos de ejecución generales
echo -e "\n${YELLOW}[6/6] Asignando permisos de ejecución a scripts internos de Hyprland...${RESET}"
find "$HYPR_DIR" -type f -name "*.sh" -exec chmod +x {} + 2>/dev/null || true

echo -e "\n${BOLD}${PINK}===========================================${RESET}"
echo -e "${BOLD}${PINK} Gracias por querer usar o probar mi proyecto, Arigatō ${RESET}"
echo -e "${BOLD}${PINK}===========================================${RESET}\n"
