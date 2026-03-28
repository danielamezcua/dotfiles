# Theming Guide

Theme files live in `themes/` inside each app's config directory (except KDE/Ghostty/Tmux).

## Color Theme

| App | File to edit | What to change | Available themes |
|-----|-------------|----------------|-----------------|
| Sway | `sway/config` | `include ~/.config/sway/themes/<theme>` | `gruvbox-dark-soft`, `catppuccin-mocha` |
| Waybar | `waybar/style.css` | `@import 'themes/<theme>.css';` | `gruvbox-dark-soft`, `catppuccin-mocha` |
| Rofi | `rofi/local.rasi` | `@theme "<theme>"` | `gruvbox-dark-soft`, `gruvbox-dark`, `simple-catppuccin` |
| Ghostty | `ghostty/local.config` | `theme = <theme>` | `Gruvbox Dark`, `Catppuccin Mocha` (built-in) |
| Kitty | `kitty/kitty.conf` | `include themes/<theme>.conf` | `tokyo-night`, `kitty_gruvbox_theme/gruvbox_dark_soft` |
| GTK 3 | `gtk-3.0/settings.ini` | `gtk-theme-name=<theme>` | System-installed GTK themes |
| GTK 4 | `gtk-4.0/gtk.css` + `gtk-dark.css` | `@import 'themes/<theme>.css';` | `gruvbox`/`gruvbox-dark`, `dracula`/`dracula-dark` |
| KDE | `kdeglobals` | `ColorScheme=` under `[General]` | System-installed color schemes |
| Tmux | `tmux/local.conf` | Toggle plugin line | `catppuccin/tmux`, `egel/tmux-gruvbox` |
| Nvim | `nvim/lua/plugins/tokyonight.lua` | `colorscheme` command | `tokyonight-moon` + variants |

## Cursor Theme

Cursors are installed system-wide via pacman/yay to `/usr/share/icons/`.

| App | File to edit | What to change |
|-----|-------------|----------------|
| Sway | `sway/config` | `seat seat0 xcursor_theme <name> <size>` |
| GTK 3 | `gtk-3.0/settings.ini` | `gtk-cursor-theme-name=` + `gtk-cursor-theme-size=` |
| GTK 4 | `gtk-4.0/settings.ini` | `gtk-cursor-theme-name=` + `gtk-cursor-theme-size=` |
| KDE | `kdeglobals` | `Theme=` + `Size=` under `[Cursors]` |

## Icon Theme

Icons are installed system-wide via pacman/yay to `/usr/share/icons/`.

| App | File to edit | What to change |
|-----|-------------|----------------|
| GTK 3 | `gtk-3.0/settings.ini` | `gtk-icon-theme-name=` |
| Rofi | `rofi/config.rasi` | `icon-theme:` |
| KDE | `kdeglobals` | `Theme=` under `[Icons]` |

## Fonts

| App | File to edit | What to change |
|-----|-------------|----------------|
| Sway | `sway/config` | `font pango:` |
| Waybar | `waybar/style.css` | `font-family:` + `font-size:` |
| Rofi | `rofi/config.rasi` | `font:` |
| Ghostty | `ghostty/local.config` | `font-family =` |
| Kitty | `kitty/kitty.conf` | `font_family` + `font_size` |
| GTK 3 | `gtk-3.0/settings.ini` | `gtk-font-name=` |
| GTK 4 | `gtk-4.0/settings.ini` | `gtk-font-name=` |
| KDE | `kdeglobals` | `font=`, `fixed=`, `menuFont=`, etc. under `[General]` |
| wlogout | `wlogout/style.css` | `font-family:` + `font-size:` |

## After Switching

- Reload Sway: `$mod+Shift+c` (Waybar reloads with it)
- GTK/KDE apps: restart them
- Tmux: `tmux source ~/.config/tmux/tmux.conf`
- Kitty: `ctrl+shift+F5`

## Theme File Locations

```
.config/
  sway/themes/          gruvbox-dark-soft, catppuccin-mocha
  waybar/themes/        gruvbox-dark-soft.css, catppuccin-mocha.css
  rofi/themes/          gruvbox-dark-soft.rasi, gruvbox-dark.rasi, simple-catppuccin.rasi
  kitty/themes/         tokyo-night.conf, kitty_gruvbox_theme/
  gtk-4.0/themes/       gruvbox.css, gruvbox-dark.css, dracula.css, dracula-dark.css
```
