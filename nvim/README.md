# Neovim Configuration

This repository contains a Neovim configuration optimized for performance and usability. It includes plugins for LSP support, autocompletion, file navigation, Git integration, and more.

## Features
- **LSP Management**: Configured with `nvim-lspconfig`.
- **Autocompletion**: Uses `nvim-cmp` and `LuaSnip`.
- **File Navigation**: `NERDTree` for easy file exploration.
- **Enhanced Statusline**: Powered by `lualine.nvim`.
- **Git Integration**: `vim-fugitive` for Git operations.
- **Fuzzy Finder**: `telescope.nvim` for file and content search.
- **Floating Terminal**: `vim-floaterm` for an integrated terminal.

## Installation
Ensure you have Neovim installed. Then, clone this repository and install the plugins:

```sh
# Clone the repository
if [ -d nvim ]; then mv nvim nvim_bk; fi # Backup existing nvim folder
git clone --depth 1 --filter=blob:none --sparse https://github.com/caiolul/dotfiles-light.git nvim 
cd nvim
git sparse-checkout set nvim
mv nvim/* .
rm -rf .git nvim
```

```sh
# Install LSP servers
npm install -g pyright typescript-language-server vscode-langservers-extracted
```

```sh
# Open Neovim and install plugins
:PlugInstall
```

## Keybindings
Some useful keybindings included in this configuration:

- **Save file**: `Ctrl + S`
- **Close buffer**: `Ctrl + Q`
- **Toggle NERDTree**: `Ctrl + N`
- **Move between splits**: `Ctrl + H/J/K/L`
- **Search files**: `Ctrl + P`
- **Live grep**: `Ctrl + F`
- **Goto definition**: `Ctrl + D`
- **Toggle terminal**: `Ctrl + T`

## Auto Formatting
The configuration includes automatic code formatting on save using LSP.

## LSP Configuration
Pre-configured LSP servers for:
- Python (`pyright`)
- HTML (`html`)
- CSS (`cssls`)
- JavaScript/TypeScript (`ts_ls`)

## Contributing
Feel free to fork this repository and submit pull requests with improvements.

## License
This project is licensed under the MIT License.

