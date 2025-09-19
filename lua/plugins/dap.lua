-- TODO remove the handler once the PR is merged  https://github.com/jay-babu/mason-nvim-dap.nvim/pull/173

return {
  "jay-babu/mason-nvim-dap.nvim",
  --dev = true,
  opts = {
    -- This line is essential to making automatic installation work
    -- 🤯
    --handlers = {},
    handlers = {
      function(config)
        -- all sources with no handler get passed here

        -- Keep original functionality
        require("mason-nvim-dap").default_setup(config)
      end,
      bash = function(config)
        -- inspired by https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/configurations.lua
        -- but adapted for my install
        config.configurations = {{
          type = "bash",
          request = "launch",
          name = "Bash: Launch file (danielle)",
          program = "${file}",
          cwd = "${fileDirname}",
          pathBashdb = vim.fn.expand('$MASON/opt/bashdb') .. "/bashdb",
          pathBashdbLib = vim.fn.expand('$MASON/opt/bashdb'),
          pathBash = "bash",
          pathCat = "cat",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          env = {},
          args = {},
          terminalKind = "integrated",
        }}
        require("mason-nvim-dap").default_setup(config) -- don't forget this!
      end,
    },
    --automatic_installation = {
    --  -- These will be configured by separate plugins.
    --  exclude = {
    --    "delve",
    --    "python",
    --  },
    --},
    -- DAP servers: Mason will be invoked to install these if necessary.
    ensure_installed = {
      "bash",
      "codelldb",
      "php",
      "python",
    },
  },
  --dependencies = {
  --  "mfussenegger/nvim-dap",
  --  "williamboman/mason.nvim",
  --},
}
