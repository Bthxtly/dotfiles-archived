return {
  { "AndrewRadev/sideways.vim", lazy = false },
  { "mbbill/undotree", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "declancm/maximize.nvim", config = true },
  { "HiPhish/rainbow-delimiters.nvim" },
  { "dstein64/vim-startuptime" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = { window = { mappings = { ["f"] = "noop" } } },
      window = { mappings = { ["<right>"] = "open", ["<left>"] = "close_node" } },
    },
  },
}
