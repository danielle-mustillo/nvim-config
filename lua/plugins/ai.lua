return {
  -- AI Assitant Window
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Change the default chat adapter and model
        chat = {
          adapter = "ollama",
          model = "qwen2.5-coder:0.5b",

          --model = "gemma3:1b",
          --model = "qwen3:0.6b",
        },
        inline = {
          adapter = "ollama",
          model = "qwen2.5-coder:0.5b",

          --model = "gemma3:270m",
          --model = "qwen3:0.6b",
        },
        cmd = {
          adapter = "ollama",
          model = "qwen2.5-coder:0.5b",

          --model = "gemma3:1b",
          -- model = "qwen3:0.6b",
        },
      },
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG",
      },
    },

  },
}
