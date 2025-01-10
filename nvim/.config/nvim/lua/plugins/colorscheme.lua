vim.cmd("source ~/dotfiles/nvim/.config/nvim/current_theme.vim")

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

  { "bringsrain/strawberry" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "strawberry-light",
      colorscheme = "gruvbox",
      icons = {
        kinds = {
          Snippet = " ",
        },
      },
    },
  },
}
