return {
  --  Can be extended further with this: https://github.com/linkarzu/dotfiles-latest/blob/main/neovim/neobean/lua/plugins/blink-cmp.lua
  --  That is where the inspiration for this code came from
  {
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
    opts = function(_, opts)
      opts.fuzzy = vim.tbl_deep_extend("force", opts.fuzzy or {}, {
        sorts = {
          "exact",
          -- defaults
          "score",
          "sort_text",
          "label",
        },
      })
      opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
        --opts.sources = {
        default = {
          'lazydev',
          "lsp",
          "path",
          "snippets",
          "buffer",
          "emoji",
        },
        providers = {
          -- -- the following was taken from https://cmp.saghen.dev/configuration/reference#fuzzy
          lsp = {
            name = "LSP",
            module = "blink.cmp.sources.lsp",
            -- You may enable the buffer source, when LSP is available, by setting this to `{}`
            -- You may want to set the score_offset of the buffer source to a lower value, such as -5 in this case
            --fallbacks = { 'buffer' },
            fallbacks = {},
            opts = { tailwind_color_icon = "██" },

            --- These properties apply to !!ALL sources!!
            --- NOTE: All of these options may be functions to get dynamic behavior
            --- See the type definitions for more information
            --enabled = true, -- Whether or not to enable the provider
            --async = false, -- Whether we should show the completions before this provider returns, without waiting for it
            --timeout_ms = 2000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
            --transform_items = nil, -- Function to transform the items before they're returned
            --should_show_items = true, -- Whether or not to show the items
            --max_items = nil, -- Maximum number of items to display in the menu
            --min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
            ---- If this provider returns 0 items, it will fallback to these providers.
            ---- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
            --score_offset = 0, -- Boost/penalize the score of the items
            --override = nil, -- Override the source's functions
          },
          path = {
            module = "blink.cmp.sources.path",
            score_offset = 3,
            fallbacks = {},
            opts = {
              trailing_slash = true,
              label_trailing_slash = true,
              -- Taken from https://cmp.saghen.dev/recipes#path-completion-from-cwd-instead-of-current-buffer-s-directory
              --get_cwd = function(_)
              --  return vim.fn.getcwd()
              --end,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = false,
              -- Treat `/path` as starting from the current working directory (cwd) instead of the root of your filesystem
              ignore_root_slash = false,
            },
          },
          buffer = {
            name = "Buffer",
            enabled = true,
            max_items = 10,
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 2,
            score_offset = -5, -- the higher the number, the higher the priority
          },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 0, -- Tune by preference
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
  },
}
