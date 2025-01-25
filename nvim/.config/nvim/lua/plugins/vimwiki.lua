vim.cmd([[
function! OpenMarkdownPreview (url)
    silent execute "!firefox --new-window " . a:url
    normal <CR>
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

return {
  -- Vimwiki plugin
  {
    "vimwiki/vimwiki",
    lazy = true,
    ft = { "markdown", "vimwiki" },
    keys = { "<leader>ww", "<leader>wt" },
    init = function()
      vim.treesitter.language.register("markdown", { "vimwiki" })
      -- vim.g.vimwiki_filetypes = { "markdown" }
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_list = {
        {
          path = "~/Documents/VimWiki",
          syntax = "markdown",
          ext = ".md",
        },
      }
    end,
  },

  -- Markdown Preview plugin
  {
    "OXY2DEV/markview.nvim",
    ft = { "markdown", "vimwiki" },
    opts = {
      preview = {
        filetypes = { "markdown", "vimwiki" },
      },
      markdown = {
        headings = { shift_width = 0 },
        list_items = { shift_width = 2 },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
