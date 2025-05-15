return {
  {
    "David-Kunz/gen.nvim",
    lazy = true,
    cmd = { "Gen" },
    opts = {
      model = "qwen2.5-coder:14b", -- The default model to use.
      quit_map = "q", -- set keymap to close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "localhost", -- The host running the Ollama service.
      port = "11434", -- The port on which the Ollama service is listening.
      display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = true, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = true, -- Never closes the window automatically.
      file = true, -- Write the payload to a temporary file to keep the command short.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
      init = function()
        pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
      end,
      -- Function to initialize Ollama
      command = function(options)
        local body = { model = options.model, stream = true }
        return "curl --silent --no-buffer -X POST http://"
          .. options.host
          .. ":"
          .. options.port
          .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
  },

  {
    "yetone/avante.nvim",
    lazy = true,
    opts = {
      -- provider = "chutes",
      -- vendors = {
      --   chutes = {
      --     __inherited_from = "openai",
      --     api_key_name = "CHUTES_API_KEY",
      --     endpoint = "https://llm.chutes.ai/v1",
      --     model = "Qwen/Qwen2.5-VL-32B-Instruct",
      --   },
      -- },
      --
      -- -- provider = "gemini", -- Recommend using Claude
      -- -- -- auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      -- -- behaviour = {
      -- --   auto_suggestions = false, -- Experimental stage
      -- --   auto_set_highlight_group = true,
      -- --   auto_set_keymaps = true,
      -- --   auto_apply_diff_after_generation = false,
      -- --   support_paste_from_clipboard = false,
      -- -- },
      -- -- gemini = {
      -- --   -- @see https://ai.google.dev/gemini-api/docs/models/gemini
      -- --   model = "gemini-2.0-flash",
      -- --   -- model = "gemini-1.5-flash",
      -- --   temperature = 0,
      -- --   max_tokens = 4096,
      -- -- },

      provider = "ollama",
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "qwen2.5-coder:14b",
      },
      mappings = {
        ask = "<leader>aa", -- ask
        edit = "<leader>ae", -- edit
        refresh = "<leader>ar", -- refresh
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>aa", desc = "avante: ask" },
      { "<leader>ae", desc = "avante: edit" },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    lazy = true,
    cmd = { "CodeCompanion" },
    opts = {
      strategies = {
        -- Change the default chat adapter
        inline = {
          adapter = "qwen",
        },
        cmd = {
          adapter = "qwen",
        },
        chat = {
          adapter = "qwen",
        },
      },
      adapters = {
        qwen = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "qwen", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "qwen2.5-coder:14b",
              },
            },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
