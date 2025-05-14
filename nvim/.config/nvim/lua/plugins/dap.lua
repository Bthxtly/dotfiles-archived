return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "mfussenegger/nvim-dap-python" },
    },

    config = function()
      -- Python
      require("dap-python").setup("python3")

      local dap = require("dap")

      -- C and C++
      dap.adapters["codelldb"] = {
        type = "executable",
        command = "/home/bthxtly/.local/share/nvim/mason/bin/codelldb",
      }
      for _, lang in ipairs({ "c", "cpp" }) do
        dap.configurations[lang] = {
          {
            type = "codelldb",
            request = "launch",
            name = "Launch file",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
          },
          {
            type = "codelldb",
            request = "attach",
            name = "Attach to process",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },

  {
    "miroshQa/debugmaster.nvim",
    config = function()
      local dm = require("debugmaster")
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      vim.keymap.set({ "n", "v" }, "<leader>n", dm.mode.toggle, { nowait = true })
      vim.keymap.set("t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup()
    end,
  },
}
