return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "pylint" },
        bash = { "shellcheck" },
      }

      -- Run pylint in the venv
      -- https://gist.github.com/Norbiox/652befc91ca0f90014aec34eccee27b2
      lint.linters.pylint.cmd = "python"
      lint.linters.pylint.args = {
        "-m",
        "pylint",
        "-f",
        "json",
        "--from-stdin",
        function()
          return vim.api.nvim_buf_get_name(0)
        end,
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() and not vim.g.disable_linting then
            if not vim.b.disable_linting then
              lint.try_lint()
            end
          end
        end,
      })

      vim.keymap.set("n", "<leader>ct", function()
        vim.b.disable_linting = not (vim.b.disable_linting == true)
      end, { desc = "Toggle linting for file" })
      vim.keymap.set("n", "<leader>cT", function()
        vim.g.disable_linting = not (vim.g.disable_linting == true)
      end, { desc = "Toggle linting for all files" })
    end,
  },
}
