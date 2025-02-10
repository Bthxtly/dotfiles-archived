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
    "mbbill/undotree",
    lazy = true,
    -- cmd = { "UndotreeToggle" },
    keys = {
      {
        "<leader>su",
        "<cmd>UndotreeToggle<cr>",
        mode = "n",
        desc = "Undotree",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = { window = { mappings = { ["f"] = "noop" } } },
      window = { mappings = { ["<right>"] = "open", ["<left>"] = "close_node" } },
    },
  },
}
