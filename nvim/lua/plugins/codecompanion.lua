local ollama_model = "qwen2.5:14b"

return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    -- plenary.nvim provides common utility functions that are used by many Neovim plugins.
    "nvim-lua/plenary.nvim",
  },

  opts = {
    -- This 'strategies' table sets the DEFAULT AI PROVIDER and MODEL
    -- for different categories of actions within the plugin.
    strategies = {
      -- Configures the default model for running custom prompts.
      cmd = {
        adapter = "ollama",
        model = ollama_model,
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = ollama_model,
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = ollama_model,
      },
    },
  },
}
