-- require("mason").setup({
--   ui = {
--     icons = {
--       package_installed = "✓",
--       package_pending = "➜",
--       package_uninstalled = "✗",
--     },
--   },
-- })
return 
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "ansible-language-server",
        "ansible-lint",
        "bash-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "flake8",
        "gofumpt",
        "goimports",
        "gopls",
        "hadolint",
        "helm-ls",
        "jdtls",
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "pyright",
        "ruff",
        "shellcheck",
        "shfmt",
        "sqlfluff",
        "stylua",
        "taplo",
        "vtsls",
        "yaml-language-server"
      },
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  }
