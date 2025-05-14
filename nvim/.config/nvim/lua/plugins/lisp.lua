return {
  {
    "gpanders/nvim-parinfer",
    ft = { "scheme" },
    keys = {
      { "<leader>cp", "<cmd>ParinferToggle<cr>", desc = "Toggle parinfer" },
    },
  },
  {
    "Olical/conjure",
    ft = { "python", "scheme" },
    init = function()
      -- Disable the documentation mapping
      vim.g["conjure#mapping#doc_word"] = false
    end,
  },
}
