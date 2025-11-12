
local wk = require("which-key")
wk.add({
  { "<leader>my", group = "yazi" },
})

return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    --
    { "<leader>my",
      group = "Yazi",
    },
    {
      "<leader>fd",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open File",
    },
    {
      -- Open in the current working directory
      "<leader>fD",
      "<cmd>Yazi cwd<cr>",
      desc = "Open Current Working Directory",
    },
    {
      "<leader>myt",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
