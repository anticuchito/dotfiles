#!/bin/bash

# Script simple para guardar cambios de .config a dotfiles
# Uso: ./save-dotfiles.sh

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$HOME/Repos/dotfiles"
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}Guardando cambios en dotfiles...${NC}\n"

# Lista de configuraciones a copiar
configs=("alacritty" "hypr" "kitty" "nvim" "rofi" "waybar" "wofi" "ghostty" "backgrounds")

# Copiar cada directorio desde .config a dotfiles
for config in "${configs[@]}"; do
  if [ -d "$CONFIG_DIR/$config" ]; then
    rsync -av --delete "$CONFIG_DIR/$config/" "$DOTFILES_DIR/config/$config/"
    echo -e "${GREEN}✓${NC} Guardado: $config"
  fi
done

# Copiar archivos individuales
[ -f "$CONFIG_DIR/starship.toml" ] && cp "$CONFIG_DIR/starship.toml" "$DOTFILES_DIR/config/"
[ -f "$CONFIG_DIR/mimeapps.list" ] && cp "$CONFIG_DIR/mimeapps.list" "$DOTFILES_DIR/config/"

echo -e "\n${GREEN}¡Listo!${NC} Cambios guardados en dotfiles"
echo -e "${BLUE}Ahora puedes hacer:${NC} cd ~/dotfiles && git add . && git commit -m 'Update config' && git push"
