-- change some telescope options and a keymap to browse plugin files
return {
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      {
        "<leader>fp",
        function()
          require("fzf-lua").files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      { "<leader>fo", "<cmd>FzfLua zoxide<cr>", desc = "Zoxide" },
    },
  },
}
