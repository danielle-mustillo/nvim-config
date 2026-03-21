return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      ansible = { "ansible_lint" },
      ["yaml.ansible"] = { "ansible_lint" },
      bash = { "shellcheck" },
      dockerfile = { "hadolint" },
      markdown = { "markdownlint-cli2" },
      python = { "ruff" },
      sh = { "shellcheck" },
      sql = { "sqlfluff" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.api.nvim_create_user_command("Lint", function()
      lint.try_lint()
    end, { desc = "Run nvim-lint for the current buffer" })

    vim.keymap.set("n", "<leader>ml", function()
      lint.try_lint()
    end, { desc = "Run lint for current file" })
  end,
}
