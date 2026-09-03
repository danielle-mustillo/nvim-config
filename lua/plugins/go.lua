return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              -- Without these, gopls treats tag-guarded e2e/integration test
              -- files as outside the build and reports "no packages found".
              buildFlags = { "-tags=e2e,e2e_agentcore,e2e_foundry,integration" },
            },
          },
        },
      },
    },
  },
}
