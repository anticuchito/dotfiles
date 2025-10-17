#!/bin/bash

# Script simple para aplicar dotfiles desde el repo
# Uso: ./apply-dotfiles.sh

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$HOME/Repos/dotfiles"
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}Aplicando dotfiles...${NC}\n"

# Lista de configuraciones a copiar
configs=("alacritty" "hypr" "kitty" "nvim" "rofi" "waybar" "wofi" "ghostty" "backgrounds")

# Copiar cada directorio
for config in "${configs[@]}"; do
  if [ -d "$DOTFILES_DIR/config/$config" ]; then
    rsync -av --delete "$DOTFILES_DIR/config/$config/" "$CONFIG_DIR/$config/"
    echo -e "${GREEN}✓${NC} Aplicado: $config"
  fi
done

# Copiar archivos individuales
[ -f "$DOTFILES_DIR/config/starship.toml" ] && cp "$DOTFILES_DIR/config/starship.toml" "$CONFIG_DIR/"
[ -f "$DOTFILES_DIR/config/mimeapps.list" ] && cp "$DOTFILES_DIR/config/mimeapps.list" "$CONFIG_DIR/"

echo -e "\n${GREEN}¡Listo!${NC} Dotfiles aplicados correctamente"
