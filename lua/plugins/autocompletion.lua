return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        -- Your configuration options here
      })
    end,
  },
  { "nvim-lua/plenary.nvim" },
  -- optional, if you are using virtual-text frontend, blink is not required.
  { "Saghen/blink.cmp" },
  { 
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    "milanglacier/minuet-ai.nvim",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "minuet" })
      --opts.performance.fetching_timeout = 2000
    end,
  },
}

-- Code Completion (WIP)
--{
--  "milanglacier/minuet-ai.nvim",
--  config = function()
--    require("minuet").setup({
--      -- Your configuration options here
--    })
--  end,
--},
--{ "nvim-lua/plenary.nvim" },
-- there is stuff in lazy.lua here, I ahven't figured it out
