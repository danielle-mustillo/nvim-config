# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Cheatsheet

### Update NVIM

To update the nvim, you can use the following command:

```
:Lazy
```

And follow instructions there.

### Disable Auto Indentation

```
<leader>uF
```

### Install an LSP
We can use the mason-lsp.nvim plugin to install an LSP client on nvim. You can type:

```
:help mason-lspconfig.nvim
```

They tell you to go to a buffer you want to install an LSP for and type:

```
:LspInstall
```

You'll need to add it to the list of mason required packages in the mason.lua file (Type ":Mason" to get the list already installed)


### Keymaps

(keymapppings for the editor)[https://www.lazyvim.org/keymaps]
