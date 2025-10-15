return {
  --  Can be extended further with this: https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/blink-cmp.lua
  --  That is where the inspiration for this code came from
   {
     "saghen/blink.cmp",
     dependencies = {
       "moyiz/blink-emoji.nvim",
     },
     opts = function(_, opts)
       opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
         default = {
           "emoji",
         },
         providers = {
           emoji = {
             module = "blink-emoji",
             name = "Emoji",
             score_offset = 15, -- Tune by preference
             opts = {
               insert = true, -- Insert emoji (default) or complete its name
               ---@type string|table|fun():table
               trigger = function()
                 return { ":" }
               end,
             },
             --should_show_items = true,
             --should_show_items = function()
             --  return vim.tbl_contains(
             --    -- Enable emoji completion only for git commits and markdown.
             --    -- By default, enabled for all file-types.
             --    { "gitcommit", "markdown" },
             --    vim.o.filetype
             --  )
             --end,
           },
         },
       })
     end,
  }
  --   --{
  --   --  "hrsh7th/nvim-cmp",
  --   --  dependencies = {
  --   --    "hrsh7th/cmp-emoji",
  --   --  "milanglacier/minuet-ai.nvim",
  --   --  },
  --   --  opts = function(_, opts)
  --   --    table.insert(opts.sources, { name = "emoji" })
  --   --    --table.insert(opts.sources, { name = "minuet" })
  --   --    --opts.performance.fetching_timeout = 2000
  --   --  end,
  --   --},
  -- },
  --{
  --  "allaman/emoji.nvim",
  --  --version = "1.0.0", -- optionally pin to a tag
  --  ft = "markdown", -- adjust to your needs
  --  dependencies = {
  --    -- util for handling paths
  --    "nvim-lua/plenary.nvim",
  --    -- optional for fzf-lua integration via vim.ui.select
  --    "ibhagwan/fzf-lua",
  --  },
  --  opts = {
  --    -- default is false, also needed for blink.cmp integration!
  --    enable_cmp_integration = true,
  --    -- optional if your plugin installation directory
  --    -- is not vim.fn.stdpath("data") .. "/lazy/
  --    --plugin_path = vim.fn.expand("$HOME/plugins/"),
  --  },
  --  config = function(_, opts)
  --    require("emoji").setup(opts)
  --    -- optional for telescope integration
  --    --local ts = require("telescope").load_extension("emoji")
  --    --vim.keymap.set("n", "<leader>se", ts.emoji, { desc = "[S]earch [E]moji" })
  --  end,
  --},
  --{
  --  "saghen/blink.cmp",
  --  --optional = true,
  --  dependencies = { "allaman/emoji.nvim", "saghen/blink.compat" },
  --  opts = {
  --    sources = {
  --      default = { "emoji" },
  --      providers = {
  --        emoji = {
  --          name = "emoji",
  --          module = "blink.compat.source",
  --          -- overwrite kind of suggestion
  --          --transform_items = function(ctx, items)
  --          --  local kind = require("blink.cmp.types").CompletionItemKind.Text
  --          --  for i = 1, #items do
  --          --    items[i].kind = kind
  --          --  end
  --          --  return items
  --          --end,
  --        },
  --      },
  --    },
  --  },
  --},
}
