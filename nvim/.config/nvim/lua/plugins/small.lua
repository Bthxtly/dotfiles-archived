return {
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "nanotee/zoxide.vim", lazy = true, cmd = { "Z" } },
  { "declancm/maximize.nvim", lazy = true, cmd = { "Maximize" } },

  {
    "AndrewRadev/sideways.vim",
    lazy = true,
    cmd = { "SidewaysLeft", "SidewaysRight" },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = { window = { mappings = { ["f"] = "noop" } } },
      window = { mappings = { ["<right>"] = "open", ["<left>"] = "close_node" } },
    },
  },
}
