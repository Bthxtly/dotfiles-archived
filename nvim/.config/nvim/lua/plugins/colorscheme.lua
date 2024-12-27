vim.cmd("source ~/dotfiles/nvim/.config/nvim/current_theme.vim")

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = { -- doesn't work, don't know why
        strings = true,
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
          Snippet = " ",
        },
      },
    },
  },
}
