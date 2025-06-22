-- Preparar lazy.nvim en el runtimepath y clonar si falta
local lazypath = vim.fn.stdpath("data") .. "/site/pack/lazy/start/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("lazy.nvim no está instalado. Clonándolo ahora...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  print("lazy.nvim clonado. Reinicia Neovim.")
  vim.opt.rtp:prepend(lazypath)
  return
end

vim.opt.rtp:prepend(lazypath)

-- Ahora sí, carga lazy.nvim y plugins
require("lazy").setup(require("plugins"))

-- Y después carga el resto de tu configuración
require('lsp')
require('settings')
require('mappings')
