local api = vim.api

return {
  {
    "stevearc/oil.nvim",
    opts = {
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
      keymaps = {
        ["+"] = "actions.select",
      },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
