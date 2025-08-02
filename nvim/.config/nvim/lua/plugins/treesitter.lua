local language = {
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
}


return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").install(language)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          local lang = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(lang) then
            return
          end

          -- highlight
          vim.treesitter.start(buf, lang)

          -- indent
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          -- fold
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    opts = {},
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
