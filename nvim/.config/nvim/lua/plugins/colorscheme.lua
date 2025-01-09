vim.cmd("source ~/dotfiles/nvim/.config/nvim/current_theme.vim")
vim.cmd('let &t_ZH="\\e[3m"')
vim.cmd('let &t_ZR="\\e[23m"')
-- vim.cmd("colorscheme gruvbox")

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    priority = 1000,
    config = true,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      contrast = "soft",
    },
  },

  {
    "morhetz/gruvbox",
    enabled = false,
    init = function()
      vim.g.gruvbox_italic = 1 -- works for me
      vim.g.gruvbox_contrast_dark = "soft"
      vim.g.gruvbox_contrast_light = "soft"
    end,
  },
  {
    "bringsrain/strawberry",
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      icons = {
        kinds = {
          Snippet = " ",
        },
      },
    },
  },
}
