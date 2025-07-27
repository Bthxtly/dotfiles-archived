#!/bin/bash

# ===get the current theme {{{
line=$(<"$HOME/dotfiles/nvim/.config/nvim/current_theme.vim")
theme=$(echo $line | cut -d= -f2)
# echo $theme
# }}}

function dark2light() {
  notify-send -u low "Swithing theme to" "LIGHT"
  mode="1 s/dark/light/"

  # wallpaper
  swww query | cut -d' ' -f8 >~/.cache/swww/.dark-wallpaper
  read wallpaper <~/.cache/swww/.light-wallpaper

  # quickshell
  cp ~/.local/state/quickshell/{light,scheme}.json
  gsettings set org.gnome.desktop.interface color-scheme default

  # qt
  cp ~/.config/qt5ct/colors/{light,scheme}.conf
  cp ~/.config/qt6ct/colors/{light,scheme}.conf

  # gtk
  cp ~/.config/gtk-3.0/{light,gtk}.css
  cp ~/.config/gtk-4.0/{light,gtk}.css
}

function light2dark() {
  notify-send -u low "Swithing theme to" "DARK"
  mode="1 s/light/dark/"

  # wallpaper
  swww query | cut -d' ' -f8 >~/.cache/swww/.light-wallpaper
  read wallpaper <~/.cache/swww/.dark-wallpaper

  # quickshell
  cp ~/.local/state/quickshell/{dark,scheme}.json
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark

  # qt
  cp ~/.config/qt5ct/colors/{dark,scheme}.conf
  cp ~/.config/qt6ct/colors/{dark,scheme}.conf

  # gtk
  cp ~/.config/gtk-3.0/{dark,gtk}.css
  cp ~/.config/gtk-4.0/{dark,gtk}.css
}

# Check the value of $theme and do the proper sed
if [[ "$theme" == "light" ]]; then
  light2dark
elif [[ "$theme" == "dark" ]]; then
  dark2light
else
  hyprctl notify 3 2000 "rgb(ff0000)" "ERROR"
  exit 1
fi

# nvim
sed -i "$mode" ~/dotfiles/nvim/.config/nvim/current_theme.vim
# kitty
sed -i "$mode" ~/dotfiles/kitty/.config/kitty/current_theme.conf
# rofi
sed -i "$mode" ~/dotfiles/rofi/.config/rofi/current_theme.rasi
# zathura
sed -i "$mode" ~/dotfiles/zathura/.config/zathura/current_theme.conf

# wallpaper
swww img $wallpaper --transition-step 20 &

# reload kitty {{{
# Get the PID of the Kitty process
kitty_pid=$(pgrep kitty)

# Check if Kitty is running
if [ -n "$kitty_pid" ]; then
  # Send SIGUSR1 to the Kitty process
  for p in $kitty_pid; do
    kill -SIGUSR1 "$p" &
  done
fi
# }}}

# relaod zathrua
zathura_pid=$(pidof zathura)
for p in $zathura_pid; do
  busctl --user call org.pwmt.zathura.PID-$p /org/pwmt/zathura org.pwmt.zathura SourceConfig &
done

# reload nvim {{{
# Get neovim sockets files
nvim_sockets=$(ls /run/user/1000/nvim*)

# Find all Neovim sockets and send the source command
for socket in $nvim_sockets; do
  if [ -S "$socket" ]; then
    # echo $socket
    nvim --server "$socket" --remote-send '<C-\><C-N>:source $HOME/dotfiles/nvim/.config/nvim/current_theme.vim<CR>:<ESC>' >/dev/null &
  fi
done
# }}}

# vim:foldmethod=marker:foldlevel=0
