vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    -- event = "VeryLazy",
    opts = function(_, opts)
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })
      return opts
    end,
    -- -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
    -- -- Be aware that you also will need to properly configure your LSP server to
    -- -- provide the inlay hints.
    -- inlay_hints = {
    --   enabled = true,
    --   exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
    -- },
    -- -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
    -- -- Be aware that you also will need to properly configure your LSP server to
    -- -- provide the code lenses.
    -- codelens = {
    --   enabled = false,
    -- },
    -- -- add any global capabilities here
    -- capabilities = {
    --   workspace = {
    --     fileOperations = {
    --       didRename = true,
    --       willRename = true,
    --     },
    --   },
    -- },
    -- -- options for vim.lsp.buf.format
    -- -- `bufnr` and `filter` is handled by the LazyVim formatter,
    -- -- but can be also overridden when specified
    -- format = {
    --   formatting_options = nil,
    --   timeout_ms = nil,
    -- },
    -- -- LSP Server Settings
    -- ---@type lspconfig.options
    -- servers = {
    --   lua_ls = {
    --     -- mason = false, -- set to false if you don't want this server to be installed with mason
    --     -- Use this to add any additional keymaps
    --     -- for specific lsp servers
    --     -- ---@type LazyKeysSpec[]
    --     -- keys = {},
    --     settings = {
    --       Lua = {
    --         workspace = {
    --           checkThirdParty = false,
    --         },
    --         codeLens = {
    --           enable = true,
    --         },
    --         completion = {
    --           callSnippet = "Replace",
    --         },
    --         doc = {
    --           privateName = { "^_" },
    --         },
    --         hint = {
    --           enable = true,
    --           setType = false,
    --           paramType = true,
    --           paramName = "Disable",
    --           semicolon = "Disable",
    --           arrayIndex = "Disable",
    --         },
    --       },
    --     },
    --   },
    -- },
    -- -- you can do any additional lsp server setup here
    -- -- return true if you don't want this server to be setup with lspconfig
    -- ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    -- setup = {
    --   -- example to setup with typescript.nvim
    --   -- tsserver = function(_, opts)
    --   --   require("typescript").setup({ server = opts })
    --   --   return true
    --   -- end,
    --   -- Specify * to use this function as a fallback for any server
    --   -- ["*"] = function(server, opts) end,
    -- },

    config = function()
      vim.lsp.inlay_hint.enable(true)
      require("mason").setup()
      require("mason-lspconfig").setup()

      -- lua_ls
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
              enable = true,
              globals = { "vim", "Snacks" }, -- Prevent warnings for Neovim globals
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })

      -- python
      require("lspconfig").pyright.setup({})

      -- c/c++
      require("lspconfig").clangd.setup({})

      -- java
      require("lspconfig").jdtls.setup({})

      -- typst
      require("lspconfig").tinymist.setup({})

      -- json
      require("lspconfig").jsonls.setup({})
    end,
  },
}
