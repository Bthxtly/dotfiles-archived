vim.cmd("source ~/dotfiles/nvim/.config/nvim/current_theme.vim")

return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
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
      overrides = {
        -- Markdown Header Background Overrides with Foreground Colors
        ["@markup.heading.1.markdown"] = { fg = "#fb4934", bg = "", bold = true },
        ["@markup.heading.2.markdown"] = { fg = "#fabd2f", bg = "", bold = true },
        ["@markup.heading.3.markdown"] = { fg = "#b8bb26", bg = "", bold = true },
        ["@markup.heading.4.markdown"] = { fg = "#8ec07c", bg = "", bold = true },
        ["@markup.heading.5.markdown"] = { fg = "#83a598", bg = "", bold = true },
        ["@markup.heading.6.markdown"] = { fg = "#d3869b", bg = "", bold = true },
      },
    },
  },

  { "bringsrain/strawberry" },
  { "sainnhe/everforest" },
  { "rose-pine/neovim" },

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
