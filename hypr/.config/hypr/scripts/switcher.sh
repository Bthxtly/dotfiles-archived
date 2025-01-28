#!/bin/bash

# ===get the current theme {{{
line=$(<"$HOME/dotfiles/nvim/.config/nvim/current_theme.vim")
theme=$(echo $line | cut -d= -f2)
# echo $theme
# }}}

# Check the value of $theme and do the proper sed
if [[ "$theme" == "light" ]]; then
  hyprctl notify 5 2000 "rgb(00000f)" "DARK"
  mode="1 s/light/dark/"
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
elif [[ "$theme" == "dark" ]]; then
  hyprctl notify 5 2000 "rgb(ffffff)" "LIGHT"
  mode="1 s/dark/light/"
  gsettings set org.gnome.desktop.interface color-scheme default
else
  hyprctl notify 3 2000 "rgb(ff0000)" "ERROR"
  exit 1
fi

# nvim
sed -i "$mode" ~/dotfiles/nvim/.config/nvim/current_theme.vim
# kitty
sed -i "$mode" ~/dotfiles/kitty/.config/kitty/current_theme.conf
# rofi
sed -i "$mode" ~/dotfiles/rofi/.config/rofi/config.rasi
# zathura
sed -i "$mode" ~/dotfiles/zathura/.config/zathura/current_theme.conf
# fcitx5
# sed -i "22 s/Dark/Light/" ~/.config/fcitx5/conf/classicui.conf

# ===reload nvim {{{
# Get neovim sockets files
nvim_sockets=$(ls /run/user/1000/nvim*)

# Find all Neovim sockets and send the source command
for socket in $nvim_sockets; do
  if [ -S "$socket" ]; then
    # echo $socket
    nvim --server "$socket" --remote-send '<C-\><C-N>:source $HOME/dotfiles/nvim/.config/nvim/current_theme.vim<CR>:<ESC>' >/dev/null
  fi
done
# }}}

# ===reload kitty {{{
# Get the PID of the Kitty process
kitty_pid=$(pgrep kitty)

# Check if Kitty is running
if [ -n "$kitty_pid" ]; then
  # Send SIGUSR1 to the Kitty process
  for p in $kitty_pid; do
    kill -SIGUSR1 "$p"
    # echo "SIGUSR1 sent to Kitty (PID: $p)"
  done
else
  echo "Kitty is not running."
fi
# }}}

# ===reload fcitx5 {{{
# if [[ "$(ps aux | grep -E '[0-9]{1,2}:[0-9]{1,2} fcitx5' | grep -o 'fcitx5')" = "fcitx5" ]]; then
#     fcitx5 -r &
# fi
# }}}

# vim:foldmethod=marker:foldlevel=0
