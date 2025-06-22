local set = vim.opt

--general vim configs, like 4 space tab, show line numbers...
set.number = true          
set.relativenumber = true  
set.tabstop = 4             
set.shiftwidth = 4          
set.expandtab = true        
set.clipboard = 'unnamedplus' 
set.termguicolors = true

-- === formatter.nvim config to have FormatOnSave ===
vim.cmd([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.vue Format
    augroup END
]])


