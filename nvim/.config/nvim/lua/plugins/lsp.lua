vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
vim.keymap.set("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "toggle inlay hints" })

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
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

      -- make lsp highlight lower priority than treesitter
      vim.highlight.priorities.semantic_tokens = 95

      -- lua_ls
      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        Lua = {
          -- Inlay hints
          hint = {
            enable = true,
            setType = true,
            arrayIndex = "Disable",
          },
          codeLens = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
            postfix = ".",
            displayContext = 50,
          },
          telemetry = {
            enable = false,
          },
        },
      })

      -- python
      vim.lsp.enable("pyright")
      vim.lsp.config("pyright", {
        cmd = { "delance-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git",
        },
        single_file_support = true,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
              inlayHints = {
                variableTypes = true,
                functionReturnTypes = true,
                callArgumentNames = true,
                pytestParameters = true,
              },
            },
          },
        },
      })

      -- rust
      vim.lsp.enable("rust_analyzer")

      -- c/c++
      vim.lsp.enable("clangd")

      -- typst
      vim.lsp.enable("tinymist")

      -- json
      vim.lsp.enable("jsonls")

      -- cmake
      vim.lsp.enable("cmake")

      -- hyprland
      vim.lsp.enable("hyprls")
    end,
  },
}
