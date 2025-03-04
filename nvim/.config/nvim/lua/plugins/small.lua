return {
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "nanotee/zoxide.vim", lazy = true, cmd = { "Z" } },
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
