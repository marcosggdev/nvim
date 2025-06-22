# Nvim

Neovim config files / plugins for a Nuxt project

## Plugins used

- NvimTree -> Nice file explorer. Open / close with <Cn> | <leader>e
- akinsho/toggleterm.nvim -> Embedded console. Open / close with <CAltGr\>
- folke/tokyonight.nvim -> Nice theme
- nvim-treesitter -> Syntax highlights
- hrsh7th/nvim-cmp -> Autocomplete
- L3MON4D3/LuaSnip -> Code snippets
- Formatter -> mhartington/formatter.nvim
- mhinz/vim-startify -> Manage sessions (save nvim state before closing and load it after)
- nvim-telescope/telescope.nvim -> Powerful file finder. (Tested with fd, and configured to use fd. Ignores files in .git, node_modules...)
- neovim/nvim-lspconfig -> Language server support

## Installation

- For windows: after installing Neovim on windows, put this nvim folder at ~/AppData/Local/nvim. Then make sure a sessions folder exists on
  your ~/AppData/Local/nvim-data/sessions, since startify will try to save and load from there.

- Other SO's: not tested. Should work but you will have to explore where to put the files yourself on those systems.

## Update info.

Im going to be pushing to this config while i develop a Nuxt project and test that the config works. If something stops working or gives 
too much problems, i'll replace those plugins for others. I hope with time, i get to a stable config, easy to port between different pc's.
