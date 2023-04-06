# Vimjitsu

This is my basic neovim config designed for web development.

## Requirements

- [Nerd Fonts](https://www.nerdfonts.com/) (Optional with manual intervention: See Documentation on customizing icons)
- [Neovim 0.8+](https://neovim.io/) (Not including nightly)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (Note: This is only necessary if you want to use auto_install feature with Treesitter)
A clipboard tool is necessary for the integration with the system clipboard (see :help clipboard-tool for supported solutions)

## Install 

Make a backup of your current nvim and shared folder
```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
Clone the repository
```
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```

## Basic Install

### Install LSP
Enter `:LspInstall` followed by the name of the server you want to install
Example: `:LspInstall pyright`

### Install language parser
Enter `:TSInstall` followed by the name of the language you want to install
Example: `:TSInstall python`
