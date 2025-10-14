vim.filetype.add({
  pattern = {
    [".*.cli"] = "sh",
  },
})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {
        -- bash-language-server reads this config key:
        -- bashIde.explainshellEndpoint = "http://localhost:5000"
        --
        -- the default configuration for this can be found here: 
        -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/bashls.lua
        --
        settings = {
          filetypes = { "sh", "bash" }, -- conf to associate to .cli files, might need to be removed later???
          --root_dir = function(fname)
          --  vim.print(fname)
          --  return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
          --end,
          bashIde = {
            --explainshellEndpoint = "https://www.explainshell.com", -- currently broken, dunno how to invoke this
            -- optional niceties:
            includeAllWorkspaceSymbols = true, -- the bash scripts we use don't have sources between them (I think... anyway just incase we add this)
            globPattern = "**/*@(.sh|.inc|.bash|.command)", -- override opensource so that we can search the whole directory (don't do this in a non-git repo though!) 
          },
        },
      },
    },
  },
}
