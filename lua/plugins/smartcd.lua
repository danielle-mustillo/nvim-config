-- This plugin is will change the CWD upon entering a file 
-- or folder in nvim. It changes to a reasonable location to
-- as a working directory (eg. where .git folder is, .gitignore, etc)

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

