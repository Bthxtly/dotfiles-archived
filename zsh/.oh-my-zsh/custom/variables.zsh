export LANG=en_US.UTF-8

# # set nvm path
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# assign neovim as default editor
export VISUAL=nvim
export EDITOR=nvim

# config globle variables
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH

export HYPRSHOT_DIR=$HOME/Pictures/Screenshots
export QT_QPA_PLATFORM=wayland
export SCREENSHOT_TOOL=grim
export SDL_VIDEODRIVER=wayland

# colorful man page
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# set go path
export GOPATH=$HOME/Applications/go
