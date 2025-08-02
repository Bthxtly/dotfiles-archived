return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enabled = true },
          -- fold
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "folke/snacks.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      Snacks.toggle({
        name = "Treesitter context",
        get = function()
          return require("treesitter-context").enabled()
        end,
        set = function()
          require("treesitter-context").toggle()
        end,
      }):map("<leader>ux")
    end,
  },
}
