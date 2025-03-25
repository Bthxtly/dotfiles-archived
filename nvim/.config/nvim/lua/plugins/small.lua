return {
  { "tpope/vim-repeat" },
  { "j-hui/fidget.nvim" },
  { "tpope/vim-surround" },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "declancm/maximize.nvim", lazy = true, cmd = { "Maximize" } },

  {
    "folke/ts-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = { lang = { markdown = "<!-- %s -->" } },
  },

  {
    "AndrewRadev/sideways.vim",
    lazy = true,
    cmd = { "SidewaysLeft", "SidewaysRight" },
  },
}
