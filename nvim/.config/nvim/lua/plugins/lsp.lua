vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
vim.keymap.set("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay hints" })

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
        -- virtual_lines = { current_line = true },
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

      -- cmake
      require("lspconfig").cmake.setup({})
    end,
  },
}
