local set = vim.opt

-- General Vim configs
set.number = true          
set.relativenumber = true  
set.tabstop = 4             
set.shiftwidth = 4          
set.expandtab = true        
set.clipboard = 'unnamedplus' 
set.termguicolors = true

-- Formatter.nvim: Auto format on save
vim.cmd([[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.ts,*.vue Format
  augroup END
]])