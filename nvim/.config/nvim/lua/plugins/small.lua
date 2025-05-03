return {
  { "tpope/vim-repeat" },
  { "tpope/vim-fugitive" },
  { "j-hui/fidget.nvim" },
  { "tpope/vim-surround" },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "dnlhc/glance.nvim", lazy = true, cmd = "Glance" },
  { "declancm/maximize.nvim", lazy = true, cmd = { "Maximize" } },

  {
    "chentoast/marks.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = { builtin_marks = { ".", "^" } },
  },

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
