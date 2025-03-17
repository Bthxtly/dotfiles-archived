alias 'brn=brn2'
alias 'cl=tty-clock -cC7'
alias 'cx=chmod +x'
alias 'f=vifm'
alias 'ff=vifm .'
alias 'hib=systemctl hibernate'
alias 'sus=systemctl suspend'
alias 'i=clear && echo $(date) && echo "I use   BTW" && fastfetch'
alias 'icat=kitten icat'
alias 'lg=lazygit'
alias 'nv=clear && nvidia-smi'
alias 'sd=unset all_proxy ALL_PROXY && ~/Applications/stable-diffusion-webui/webui.sh'
alias 'sl=sl -e'
alias "pkg_size=expac -H M '%m\t%n' | sort -h"
# alias "pkg_size=(LC_ALL=C.UTF-8 pacman -Qi | awk '/^Name/{name=\$3} /^Installed Size/{print \$4\$5, name}' | LC_ALL=C.UTF-8 sort -h)"
alias 'waybar=killall waybar; waybar &'
alias "fzf=fzf --bind=ctrl-e:preview-down,ctrl-y:preview-up --reverse --color=16 --preview-window=65%:wrap:border-sharp: --preview 'bat --color=always --style=plain,changes {}'"

# wayland
alias 'code=code  --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto'
alias 'mechvibes=mechvibes --in-process-gpu'

# ls
alias 'l=eza -lah --icons'
alias 'ls=eza --icons'
alias 'll=eza -lh --icons'
alias 'lt=eza --icons --tree'

# exit
alias ':q=exit'
alias ':wq=exit'
alias 'e=exit'
alias 'q=exit'
alias 'exti=exit'
alias 'eixt=exit'
alias 'eitx=exit'
alias 'etxi=exit'
alias 'etix=exit'
alias 'xeit=exit'
alias 'xeti=exit'
alias 'xiet=exit'
alias 'xite=exit'
alias 'xtei=exit'
alias 'xtie=exit'

# git
alias 'gc=git commit -m'
alias 'gk=git checkout'
alias 'gu=git commit -m "update"'
alias 'gr=git rebase'
alias 'guu=git add --all && git commit -m "update" && git push'
alias 'gla=git log --all --decorate --oneline --graph'

# [neo]vim
alias 'h=nvim "+FzfLua files cwd=$HOME/.config/hypr"'
# alias 'iii=nvim ~/.config/i3/config'
alias 'k=nvim ~/.config/kitty/kitty.conf'
alias 'lc=nvim leetcode.nvim'
alias 'v=nvim'
alias 'vc=nvim "+FzfLua files cwd=~/.config/nvim"'
alias 'vd=nvim ~/Documents/VimWiki/diary.md'
alias 'vr=nvim -R'
alias 'vt=nvim ~/Documents/VimWiki/index.md'
alias 'vv=nvim .'
alias 'vz=nvim ~/.zshrc && source ~/.zshrc'
alias 'vza=nvim ~/.oh-my-zsh/custom/aliases.zsh && source ~/.oh-my-zsh/custom/aliases.zsh'
alias 'vzv=nvim ~/.oh-my-zsh/custom/variables.zsh && source ~/.oh-my-zsh/custom/variables.zsh'

# something might be useful
alias 'term_size=echo "Rows=$(tput lines) Cols=$(tput cols)"'

# kmonad
alias 'kk=killall kmonad'
alias 'km=kmonad ~/.config/kmonad/config.kbd &'
alias 'vk=nvim ~/.config/kmonad/config.kbd'

# proxy
alias proxy="
    export http_proxy=socks5://127.0.0.1:7897;
    export https_proxy=socks5://127.0.0.1:7897;
    export all_proxy=socks5://127.0.0.1:7897;
    export no_proxy=socks5://127.0.0.1:7897;
    export HTTP_PROXY=socks5://127.0.0.1:7897;
    export HTTPS_PROXY=socks5://127.0.0.1:7897;
    export ALL_PROXY=socks5://127.0.0.1:7897;
    export NO_PROXY=socks5://127.0.0.1:7897;"
alias unproxy="
    unset http_proxy;
    unset https_proxy;
    unset all_proxy;
    unset no_proxy;
    unset HTTP_PROXY;
    unset HTTPS_PROXY;
    unset ALL_PROXY;
    unset NO_PROXY"
