vim.cmd("source ~/.config/nvim/current_theme.vim")

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
        SignColumn = { link = "LineNr" },
        -- Markdown Header Background Overrides with Foreground Colors
        ["@markup.heading.1.markdown"] = { fg = "#cc241d", bg = "", bold = true },
        ["@markup.heading.2.markdown"] = { fg = "#98971a", bg = "", bold = true },
        ["@markup.heading.3.markdown"] = { fg = "#d79921", bg = "", bold = true },
        ["@markup.heading.4.markdown"] = { fg = "#458588", bg = "", bold = true },
        ["@markup.heading.5.markdown"] = { fg = "#b16286", bg = "", bold = true },
        ["@markup.heading.6.markdown"] = { fg = "#689d6a", bg = "", bold = true },
      },
    },
  },

  { "sainnhe/everforest" },
  { "Bthxtly/mini.base16" },
  { "rose-pine/neovim" },
}
