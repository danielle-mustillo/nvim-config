-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
wk.add({
  { "<leader>m", group = "My Mappings" }, 
  { "<leader>mj", group = "Java Mappings" },
})

-- 
-- Diff files
--vim.keymap.set("n", "<leader>mC", function()
--  require("telescope").extensions.diff.diff_files({ hidden = true })
--end, { desc = "Compare 2 files" })
--
--vim.keymap.set("n", "<leader>mc", function()
--  require("telescope").extensions.diff.diff_current({ hidden = true })
--end, { desc = "Compare file with current" })

-- Refactor (java)
vim.keymap.set("n", "<leader>mjv", function()
  require('jdtls').extract_variable()
end, { desc = "Extract variable (java)" })

vim.keymap.set("n", "<leader>mjV", function()
  require('jdtls').extract_variable_all_occurences()
end, { desc = "Extract all variable occurences (java)" })

vim.keymap.set("n", "<leader>mjc", function()
  require('jdtls').extract_constant()
end, { desc = "Extract constant (java)" })


vim.keymap.set("n", "<leader>mjm", function()
  require('jdtls').extract_method()
end, { desc = "Extract method (java)" })

vim.keymap.set("n", "<leader>mjf", function()
  require('jdtls').extract_field()
end, { desc = "Extract field (java)" })
