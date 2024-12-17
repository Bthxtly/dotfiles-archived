-- local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_configs["vimwiki"] = {
--   experimental = true,
--   install_info = {
--     files = { "src/parser.c", "src/scanner.c" },
--     location = "tree-sitter-markdown",
--     url = "https://github.com/MDeiml/tree-sitter-markdown",
--   },
--   maintainers = { "@MDeiml" },
--   readme_name = "markdown (basic highlighting)",
-- }

vim.cmd([[
function! OpenMarkdownPreview (url)
    silent execute "!google-chrome-stable --new-window " . a:url
    normal <CR>
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])

return {
  -- Vimwiki plugin
  {
    "vimwiki/vimwiki",
    init = function()
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
    enabled = true,
    lazy = false, -- Recommended
    opts = {
      filetypes = { "markdown", "vimwiki", "Avante" },
      vim.treesitter.language.register("markdown", { "vimwiki" }),
    },
    ft = { "markdown", "vimwiki", "Avante" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
