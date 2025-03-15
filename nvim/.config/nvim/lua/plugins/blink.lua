return {
  -- code completion
  {
    "saghen/blink.cmp",
    -- dependencies = "rafamadriz/friendly-snippets",
    -- version = "*",
    build = "cargo build --release",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    opts_extend = { "sources.default" },
    opts = {
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      appearance = {
        ...,
      },

      signature = { enabled = true },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      -- command line and search
      cmdline = {
        enabled = true,
        completion = {
          menu = { auto_show = true },
        },
        keymap = {
          ["<LEFT>"] = {},
          ["<RIGHT>"] = {},
        },
      },

      keymap = {
        ["<C-y>"] = { "accept", "fallback" },
        ["<C-k>"] = { "fallback" }, -- disable <c-k> in insert mode
        ["<CR>"] = {},
        ["<UP>"] = {},
        ["<DOWN>"] = {},
      },
    },
  },

  -- add and edit snippets easily
  {
    "chrisgrieser/nvim-scissors",
    -- dependencies = "nvim-telescope/telescope.nvim",
    lazy = true,
    opts = {
      snippetDir = vim.fn.stdpath("config") .. "/snippets",
      jsonFormatter = "jq",
    },
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
  },

  {
    "folke/lazydev.nvim",
    lazy = true,
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
