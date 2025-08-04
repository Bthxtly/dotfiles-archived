<!--
vim:nospell:nowrap
-->
# These are my dotfiles
They are precious and fantastic!

## [Hyprland](https://hyprland.org)
Hyprland is a tiling window manager on Wayland. [Here](https://github.com/JaKooLit/Arch-Hyprland)
is a much more advanced configuration.
```sh
hypr
├── configs
│   ├── appearence.conf
│   ├── autostart.conf
│   ├── input.conf
│   ├── keybinds.conf
│   ├── monitor.conf
│   ├── plugins.conf
│   ├── variables.conf
│   ├── windowrule.conf
│   └── workspacerule.conf
├── hypr.conf               # hyprland X11 edition
├── hypridle.conf           # deal with suspend
├── hyprland.conf           # refer to "configs/"
├── hyprlock.conf           # lock screen
├── pyprland.toml           # scratch pads
└── scripts
    ├── BrightnessKbd.sh    # use keyboard to modify brightness and send notifications
    ├── hypridle-toggle.sh  # toggle hypridle
    ├── hyprlock_playerctl.sh
    ├── icons/
    ├── monitor-toggle.sh   # toggle laptop monitor when connected to external
    ├── screen-recorder.sh  # record screen, certain window or rect region
    ├── switcher.sh         # switcher between light and dark mode for kitty, nvim, rofi and zathura
    ├── Volume.sh           # use keyboard to modify volume and send notifications
    ├── wallpaper_launcher.sh
    └── xdg-d-p-hypr.sh     # I forget its function
```

## [neovim](https://github.com/neovim/neovim)
~Based on [LazyVim](https://lazyvim.org), a neovim distribution.~\
Totally separated from LazyVim.
```sh
nvim
├── colors/                 # my own color scheme, depend on mini.base16
├── current_theme.vim       # works with hypr/.config/hypr/scripts/switcher.sh
├── ftplugin                # file type specific settings
│   ├── java.lua            # set up for nvim-jdtls
│   ├── markdown.lua        # spell, wrap, textwidth and colorcolumn
│   ├── typst.lua           # comment string with above
│   └── vimwiki.lua         # same as markdown
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua        # set up lazy.nvim
│   │   ├── options.lua
│   │   └── run.lua         # run codes and Manim project
│   └── plugins
│       ├── 2048.lua        # play 2048 in neovim
│       ├── ai.lua          # use ollama with neovim
│       ├── blink.lua       # auto completion, snippets, tree and pairs
│       ├── colorscheme.lua # gruvbox, strawberry(pink) and everforest color scheme
│       ├── conform.lua     # auto format codes
│       ├── easy_align.lua  # align is important
│       ├── fzf.lua         # very excellent fuzzy finder
│       ├── gitsigns.lua    # show git signs
│       ├── highlight.lua   # add highlight supports for some file types
│       ├── hydra.lua       # sub-mode
│       ├── illuminate.lua  # highlight same references
│       ├── java.lua        # better java experience, only for collage course
│       ├── kitty_scrollback.lua  # operate kitty like in nvim buffer
│       ├── leetcode.lua    # do leetcode in nvim
│       ├── lisp.lua        # learn scheme from cs61a.org
│       ├── lsp.lua         # nvim-lspconfig and some custom settings
│       ├── lualine.lua     # status line
│       ├── markdown.lua    # vimwiki, markview and markdown-preview, for taking notes
│       ├── marks.lua       # show marks on status column
│       ├── mini.lua        # more text objects
│       ├── neovide.lua     # neovim GUI
│       ├── oil.lua         # file manager in nvim buffer
│       ├── origami.lua     # <left> and <right> to unfold and fold
│       ├── outline.lua     # symbol tree
│       ├── persistence.lua # save and load sessions
│       ├── small.lua       # surround, rainbow brackets, repeat, zoxide, maximize and sideways
│       ├── snacks.lua      # dashboard, image, picker and more
│       ├── treesitter.lua  # highlight, indent and more text objects
│       ├── trouble.lua     # display diagnostics messages
│       ├── typst.lua       # typst-preview
│       ├── undotree.lua    # walk trough the undo history
│       ├── uv.lua          # auto active uv Python environment
│       └── which-key.lua   # show available key binds
├── snippets/
├── spell/
└── stylua.toml
```

## [kitty](https://sw.kovidgoyal.net/kitty)
 Kitty is a powerful and [highly customizable](https://sw.kovidgoyal.net/kitty/conf)
 terminal emulator.
```sh
kitty
├── current_theme.conf      # works with hypr/.config/hypr/scripts/switcher.sh
├── gruvbox_dark.conf       # theme
├── gruvbox_light.conf      # theme
├── kitty.conf              # font, kitty_scrollback and key binds to work like tmux
├── kitty_all.conf          # all options
├── quick_access_terminal.conf # quick access terminal options
├── Rose_Pine_Dawn.conf     # theme
└── Rose_Pine_Moon.conf     # theme
```

## [quickshell](https://quickshell.org)
Quickshell is a toolkit for building status bars, widgets, lock screens, and
other desktop components using QtQuick. It can be used alongside your Wayland
compositor or window manager to build a complete desktop environment.

This config is based on [caelestia's setup](https://github.com/caelestia-dots/shell).
I remove weather widgets, and add buttons to toggle pwvucontrol special
workspace, and so on...
<!-- TODO: add differences -->
```sh
quickshell/
├── assets
│   ├── beat_detector.cpp
│   ├── bongocat.gif
│   └── wrap_term_launch.sh
├── config
│   ├── Appearance.qml
│   ├── BarConfig.qml
│   ├── BorderConfig.qml
│   ├── Config.qml
│   ├── DashboardConfig.qml
│   ├── LauncherConfig.qml
│   ├── LockConfig.qml
│   ├── NotifsConfig.qml
│   ├── OsdConfig.qml
│   ├── SessionConfig.qml
│   ├── UserPaths.qml
│   └── WInfoConfig.qml
├── modules
│   ├── areapicker/
│   ├── bar/
│   ├── dashboard/
│   ├── drawers/
│   ├── launcher/
│   ├── lock/
│   ├── notifications/
│   ├── osd/
│   ├── session/
│   ├── Shortcuts.qml
│   ├── utilities/
│   └── windowinfo/
├── services
│   ├── Audio.qml
│   ├── BeatDetector.qml
│   ├── Brightness.qml
│   ├── Cava.qml
│   ├── Colours.qml
│   ├── Hyprland.qml
│   ├── Network.qml
│   ├── Notifs.qml
│   ├── Players.qml
│   ├── Requests.qml
│   ├── SystemUsage.qml
│   ├── Time.qml
│   ├── Visibilities.qml
│   └── Wallpapers.qml
├── shell.qml
├── utils
│   ├── Icons.qml
│   ├── Paths.qml
│   ├── scripts/
│   └── Searcher.qml
└── widgets
    ├── CachingImage.qml
    ├── Colouriser.qml
    ├── CustomMouseArea.qml
    ├── CustomShortcut.qml
    ├── ExtraIndicator.qml
    ├── filedialog
    ├── MaterialIcon.qml
    ├── Ref.qml
    ├── StateLayer.qml
    ├── StyledClippingRect.qml
    ├── StyledListView.qml
    ├── StyledRect.qml
    ├── StyledScrollBar.qml
    ├── StyledTextField.qml
    ├── StyledText.qml
    ├── StyledWindow.qml
    └── VerticalSlider.qml
```
## zsh([ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) as the framework)
**Z SH**ell is a powerful shell. Oh My Zsh is a framework for managing zsh
configuration.
```sh
zsh
├── .oh-my-zsh
│   └── custom
│       ├── aliases.zsh
│       ├── api.zsh
│       ├── background.zsh  # run zathura independent of terminal
│       ├── example.zsh
│       ├── plugins/
│       ├── themes/
│       ├── timer.zsh
│       ├── variables.zsh
│       └── zoxide.zsh
├── .p10k.zsh
├── .zprofile
├── .zshenv
└── .zshrc

(most unimportant files are ignored)
```

## [vifm](https://github.com/vifm/vifm)
Vifm is a **VI**m-like **F**ile **M**anager in terminal.
```sh
vifm
├── colors/                 # gruvbox theme
├── favicons.vifm
├── scripts/                # nothing here though
├── vifm-help.txt
└── vifmrc                  # I think only this matters, or not even this...
```

## [kmonad](https://github.com/kmonad/kmonad)
Kmonad is "an advanced keyboard manager", which enable you to change keyboard
layout and add layers for __any__ keyboards.
```sh
kmonad
├── colemak-dh-seniply-split.kbd  # an example of custom keyboard(https://stevep99.github.io/seniply/)
├── config.kbd                    # my config file, use colemak layout and many many layers
├── Keycode.hs                    # keynames
├── tutorial.kbd                  # official tutorial from its github repo
└── wireless.kbd                  # my config for wireless keyboard
```

## [fusuma](https://github.com/iberianpig/fusuma)
Fusuma enables more gestures for touchpad.
```sh
fusuma
└── config.yml
```

## [rofi](https://github.com/davatorium/rofi)
Rofi is a dmenu replacement as an application launcher and window switcher
```sh
rofi
├── config.rasi
├── current_theme.rasi      # works with hypr/.config/hypr/scripts/switcher.sh
├── gruvbox-rofi/
└── wallSelect.rasi         # wallpaper selection theme
```

## [zathura](https://github.com/pwmt/zathura)
Zathura is a simple Document viewer that supports vim-like keybinds.
```sh
zathura
├── current_theme.conf      # works with hypr/.config/hypr/scripts/switcher.sh
├── zathura-gruvbox/
└── zathurarc               # keybinds, scroll method and colorscheme
```

## [vimium](https://github.com/philc/vimium)
Vimium is an browser extension available on Chrome and Firefox, enables you to
operate webpages in the vim way.
```sh
vimium/
├── keymap.txt
├── search_engines.txt
├── vimium-options.json     # the export file
├── vimiumUI_gruvboxDark.css
└── vimiumUI_gruvboxLight.css
```

## software below are no longer used

### [waybar](https://github.com/Alexays/Waybar)
***(Alternative: quickshell)***\
Waybar is a highly customizable Wayland bar.
```sh
waybar
├── config.jsonc
└── style.css
```

### [vlc](https://www.videolan.org/vlc)
***(Alternative: MPV)***\
VLC is a media player.
```sh
vlc
├── vlc-qt-interface.conf
└── vlcrc
```

### [firefox](https://www.firefox.com)
***(Alternative: [zen browser](https://zen-browser.app/))***\
A browser boosts many advantages like vertical tabs, flexible themes, and,
most importantly, open source.
```sh
firefox/                    # themes
├── gruvbox_dark.zip
└── gruvbox_light.zip
```
