<!---
vim:nospell:nowrap
--->
# This is my dotfiles
They are precious and I can't lose them!

## Hyprland
[Hyprland](https://hyprland.org) is a tiling window manager on Wayland

```sh
hypr
└── .config
    └── hypr
        ├── configs
        │   ├── appearence.conf
        │   ├── autostart.conf
        │   ├── input.conf
        │   ├── keybinds.conf
        │   ├── plugins.conf
        │   ├── variables.conf
        │   └── windowrule.conf
        ├── hypridle.conf
        ├── hyprland.conf
        ├── hyprlock.conf
        ├── hyprpaper.conf
        ├── pyprland.toml
        └── scripts
            ├── BrightnessKbd.sh  # use keyboard to modify brightness and send notifications
            ├── icons/
            ├── switcher.sh       # switcher between light and dark mode for kitty, nvim, rofi and zathura
            ├── Volume.sh         # use keyboard to modify volume and send notifications
            └── xdg-d-p-hypr.sh   # I forget its function
```

## Neovim
Based on [LazyVim](https://lazyvim.org)

```sh
nvim
└── .config
    └── nvim
        ├── current_theme.vim     # works with hypr/.config/hypr/scripts/switcher.sh, in .gitignore
        ├── init.lua
        ├── lazy-lock.json
        ├── lazyvim.json
        ├── lua
        │   ├── config
        │   │   ├── autocmds.lua    # doesn't matter
        │   │   ├── keymaps.lua     # old keymaps from my origin vimrc
        │   │   ├── lazy.lua        # doesn't matter
        │   │   └── options.lua     # old options from my origin vimrc
        │   └── plugins
        │       ├── ai.lua          # use ollama with neovim
        │       ├── blink.lua       # auto completion
        │       ├── colorscheme.lua # gruvbox, strawberry(pink) and everforest colorscheme
        │       ├── disable.lua     # don't get used to bufferline and flash
        │       ├── easy_align.lua  # align is important
        │       ├── highlight.lua   # add highlight supports for some file types
        │       ├── kitty_scrollback.lua  # operate kitty like in nvim buffer
        │       ├── mini.lua        # more text objects
        │       ├── neovide.lua     # neovim GUI
        │       ├── oil.lua         # file manager in nvim buffer
        │       ├── outline.lua     # symbol tree
        │       ├── small.lua       # vim-surround, rainbow brackets, dot-repeat, zoxide, undotree, maximize, sideways and image support
        │       ├── snacks.lua      # dashboard
        │       ├── fzf.lua         # very excellent fuzzy finder
        │       ├── toggleterm.lua  # wait to be configured
        │       ├── vimtex.lua      # wait to be configured
        │       └── vimwiki.lua     # vimwiki, markview and markdown-preview, used to take notes
        ├── .neoconf.json           # doesn't matter
        ├── pack                    # doesn't matter
        │   └── minpac              # doesn't matter
        │       ├── opt             # doesn't matter
        │       └── start           # doesn't matter
        └── stylua.toml             # doesn't matter
```

## Kitty
[Kitty](https://sw.kovidgoyal.net/kitty/conf) is a powerful and highly customizable terminal emulator

```sh
kitty
└── .config
    └── kitty
        ├── current_theme.conf    # works with hypr/.config/hypr/scripts/switcher.sh, in .gitignore
        ├── gruvbox_dark.conf     # theme
        ├── gruvbox_light.conf    # theme
        ├── kitty_all.conf        # all options
        └── kitty.conf            # font, kitty_scrollback and keybinds to work like tmux
```
