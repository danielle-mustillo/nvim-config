return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      sort_by = "insert_after_current", -- or "directory", "extension", etc.
      numbers = "ordinal",             -- shows buffer numbers
      separator_style = "slant", --"slope",
      diagnostics = "nvim_lsp",
      max_name_length = 32,
      --indicator = {
      --  style = "underline",
      --}
    },
  },
}

