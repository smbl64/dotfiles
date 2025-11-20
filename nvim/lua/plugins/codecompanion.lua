local ollama_model = "qwen2.5-coder:7b"

return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
    "nvim-lua/plenary.nvim",
  },

  opts = {
    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = ollama_model,
              },
              num_ctx = {
                default = 20000,
              },
            },
          })
        end,
      }
    },

    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {
      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = {
          name = "ollama",
          model = ollama_model,
        }
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = {
          name = "ollama",
          model = ollama_model,
        }
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = {
          name = "ollama",
          model = ollama_model,
        }
      },
    },
  },
}
