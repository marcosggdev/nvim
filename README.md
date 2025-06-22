# nvim-nuxt-config

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

### Windows:
  - Install lazy.nvim with git clone:
    `git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim`

  - After that, put this nvim folder (this repo root folder) at ~/AppData/Local/nvim. Then make sure a sessions folder exists on
    your ~/AppData/Local/nvim-data/sessions, since startify will try to save and load from there.

  - Also, for some plugins to work, you'll need to install fd (file finder which Telescope will use) and prettier globally.
    To download and install fd, install chocolatey for windows using powershell with admin privileges:
    `Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    `
    After that, enable scripts execution:
    `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
    Now you are able to install fd with the command:
    `choco install fd`  
    Once you have fd, install prettier GLOBALLY:
    `npm install -g prettier`
    Also for the formatter, you'll need a C compiler. I installed MinGW64 from:
    `https://www.mingw-w64.org/downloads/`
    You'll need to add its bin dir to the windows PATH, and test if the commands g++ and gcc work at the cmd globally

    And that should be it. If you try to open Nvim and errors appear, dont worry. Probably theres a missing dependency. These config files purpose is that: ensure that
    the config files are fine.

  - If you achieve to make it work, use the comand :Lazy update, or :Lazy sync when u open Nvim. It will update the plugins. (They will install automatically when u open Nvim, unless
    theres errors)

## What's gonna happen in this repo?

Im going to be pushing to this config while i develop a Nuxt project and test that the config works. If something stops working or gives 
too much problems, i'll replace those plugins for others. I hope with time, i get to a stable config, easy to port between different pc's.

If i find the time, i might try to create a docker container for running Neovim with a config without issues. This program is highly customizable, but errors can be a pain, and to make 
a config from scratch takes SO long. If i finally do it, i'll link the container image here.
