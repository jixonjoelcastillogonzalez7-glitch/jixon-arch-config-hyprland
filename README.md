# Arch + Hyprland

Respaldo personal de mi configuración actual de Arch Linux + Hyprland.

Este repositorio contiene mis configuraciones, paquetes, servicios y dependencias necesarias para reconstruir mi entorno.

## Configuración

- hypr/hyprland.lua
- hypr/hyprpaper.conf
- hypr/hyprlock.conf
- waybar/config.jsonc
- waybar/style.css
- fuzzel/fuzzel.ini
- kitty/kitty.conf

## Aplicaciones principales

- Hyprland
- Hyprpaper
- Hyprlock
- Waybar
- Fuzzel
- Kitty
- Dolphin

## Controles

- brightnessctl: brillo
- playerctl: multimedia
- wpctl: volumen mediante PipeWire
- nmgui: administración gráfica de Wi-Fi
- blueman-manager: administración gráfica de Bluetooth

## Audio

- PipeWire
- PipeWire Pulse
- WirePlumber

## Red

- NetworkManager

## Bluetooth

- BlueZ
- Blueman

## Wayland

- xdg-desktop-portal-hyprland
- xdg-desktop-portal
- xdg-desktop-portal-gtk

## Fuente

Waybar utiliza:

- ttf-jetbrains-mono-nerd

Esta fuente proporciona los iconos Nerd Font utilizados en la barra.

## Tema oscuro

Hyprland ejecuta:

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

`gsettings` pertenece al paquete `glib2`.

## Inventarios

- packages/official.txt: paquetes oficiales instalados explícitamente.
- packages/aur.txt: paquetes externos/AUR.
- packages/explicit.txt: todos los paquetes instalados explícitamente.
- packages/all-installed.txt: todos los paquetes instalados.
- services/services-enabled.txt: servicios del sistema habilitados.
- services/user-services-enabled.txt: servicios del usuario habilitados.
- services/services-running.txt: servicios del sistema activos durante el respaldo.
- services/user-services-running.txt: servicios del usuario activos durante el respaldo.

## Wallpaper

El wallpaper utilizado actualmente por Hyprpaper y Hyprlock está guardado en:

wallpapers/fondo.png

## Objetivo

Este repositorio no intenta ser una configuración genérica de Hyprland.

Es mi respaldo personal de la configuración que funciona actualmente en mi equipo.
