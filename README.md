# Installation

Clone the repo and use stow to create the symlinks and you should get something like this.

![Arch](/resources/main.png)

## Details

This information would take up a lot a of space so expand what you are insterested in.

<details>
<summary>Arch Packages</summary>

Probably missed some but the most important ones are here I guess.

| Name                     | Source | Description               |
| :----------------------- | :----- | :------------------------ |
| stow                     | APKG   | Create symlinks           |
| feh                      | APKG   | Set desktop Image         |
| flameshot                | APKG   | Screenshots               |
| exa                      | APKG   | Better ls                 |
| lazygit                  | APKG   | Git terminal integration  |
| redshift                 | APKG   | Monitor color temperature |
| ttf-ms-fonts             | AUR    | Core Microsoft fonts      |
| google-chrome            | AUR    | Browser                   |
| darkman                  | AUR    | Darkmode                  |
| cpu-x                    | AUR    | Hardware information      |
| openrgb                  | AUR    | RGB control               |
| spotify, spotify-adblock | AUR    | Music player and adblock  |
| hdparm                   | APKG   | HDD spindown util         |
| fzf                      | APKG   | Fuzzy search              |
| zsh, oh-my-zsh           | APKG   | Shell with framework      |
| pipewire                 | APKG   | Audio                     |
| picom                    | APKG   | Blur                      |
| rofi                     | APKG   | Quick Laucher             |
| polybar                  | APKG   | Nicer status bar          |
| alacritty                | APKG   | Terminal                  |

</details>

<details>
<summary>Neovim Setup</summary>

## Requirements

- [Neovim](https://neovim.io) (Version 0.8.0 or later)
- [NerdFonts](https://www.nerdfonts.com)
- [RipGrep](https://github.com/BurntSushi/ripgrep)
- Terminal with True Color

## Plugins

I use [Lazy](https://github.com/folke/lazy.nvim) as my plugin manager

#### Theme and Rice

- [marko-cerovac/material.nvim](https://github.com/marko-cerovac/material.nvim) - With the darker variant
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Status Line
- [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim) - Nicer Tabs
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Icons
- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) - Cool startup menu

#### Utilities

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) - Fast comments
- [tpope/vim-surround](https://github.com/tpope/surround) - Fast surround changer
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) - Markdown Previewer
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Bracket Pairing
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File Tree
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Better Syntax Highlight
- [windwp/nvim-spectre](https://github.com/windwp/nvim-spectre) - Find and Replace VSCode like
- [andweeb/presence.nvim](https://github.com/andweeb/presence.nvim) - Show discord users that u are superior

#### LSP & Completion

- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) - Amalgamation of LSP and CMP

#### File and Window Navigation

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Tmux and Window Navigator
- [nvim-lua/telescope.nvim](https://github.com/nvim-lua/telescope.nvim) - Telescope and Dependencies
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-lua/popup.nvim](https://github.com/nvim-lua/popup.nvim)
- [jremmen/vim-ripgrep](https://github.com/jremmen/vim-ripgrep)

</details>
