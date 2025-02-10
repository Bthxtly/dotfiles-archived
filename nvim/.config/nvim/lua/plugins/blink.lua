return {
  -- code completion
  {
    "saghen/blink.cmp",
    build = "cargo build --release",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {

      sources = {
        providers = {
          snippets = {
            opts = {
              search_paths = { vim.fn.stdpath("config") .. "/snippets" },
            },
          },
        },

        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return { "buffer" }
          end
          -- Commands
          if type == ":" then
            return { "cmdline" }
          end
          return {}
        end,
      },

      keymap = {
        ["<C-y>"] = { "accept", "fallback" },
        ["<CR>"] = {},
      },
    },
  },

  -- add and edit snippets easily
  {
    "chrisgrieser/nvim-scissors",
    keys = {
      {
        "<leader>se",
        function()
          require("scissors").editSnippet()
        end,
        desc = "Edit snippet",
        mode = "n",
      },
      {
        "<leader>sn",
        function()
          require("scissors").addNewSnippet()
        end,
        desc = "Add new snippet",
        mode = { "n", "v" },
      },
    },
    -- dependencies = "nvim-telescope/telescope.nvim",
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
    },
  },
}
