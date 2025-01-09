vim.cmd([[au BufRead,BufNewFile *.kbd set filetype=kbd]])
vim.cmd([[au BufRead,BufNewFile *.rasi set filetype=rasi]])
vim.cmd([[au BufRead,BufNewFile *hypr/*.conf,*hypr/*/*.conf set filetype=rasi]])

return {
  { "ap/vim-css-color", event = "VeryLazy" },
  { "Fymyte/rasi.vim", lazy = true, ft = "rasi" },
  { "kmonad/kmonad-vim", lazy = true, ft = "kbd" },
  { "fladson/vim-kitty", lazy = true, ft = "kitty" },
  { "Bthxtly/hyprland-vim-syntax", lazy = true, ft = "hypr" },
}
