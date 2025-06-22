-- Prepare lazy.nvim at runtimepath or clone if doesnt exist
local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("lazy.nvim not installed. Cloning it now...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  print("lazy.nvim cloned. Restart Neovim.")
  vim.opt.rtp:prepend(lazypath)
  return
end

-- Load lazy.nvim and plugins from plugins.lua
require("lazy").setup(require("plugins"))

-- Load the rest of config files
require('lsp')
require('settings')
require('mappings')
