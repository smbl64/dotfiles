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
        model = "qwen2.5:14b",
      },

      -- Configures the model for the interactive chat window (:CompanionChat).
      chat = {
        adapter = "ollama",
        model = "qwen2.5:14b",
      },

      -- Configures the model for any action that modifies code directly in your buffer
      -- using the 'inline' strategy.
      inline = {
        adapter = "ollama",
        model = "qwen2.5:14b",
      },
    },

    prompt_library = {
      -- The name of the custom prompt. Run with :CodeCompanionActions
      ["Boilerplate HTML"] = {
        strategy = "chat",
        description = "Generate some boilerplate HTML",
        prompts = {
          {
            role = "system",
            content = "You are an expert HTML programmer",
          },
          {
            role = "user",
            content =
            "<user_prompt>Please generate some HTML boilerplate for me. Return the code only and no markdown codeblocks</user_prompt>",
          },
        },
      },
    },
  },
}
