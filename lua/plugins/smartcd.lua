return  {
  "https://gitlab.com/trxnvim/kharon.nvim.git",
  opts = {},
  event = { "BufEnter", "BufRead" },
  -- optional (only makes sense if 'cmd' is true)
  cmd = "SmartCd",
  -- optional (only makes sense if 'keymap' is true)
  keys = {
    { "cd", description = "Smart cd" }
  },
}

