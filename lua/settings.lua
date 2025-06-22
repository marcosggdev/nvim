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

-- Create folders if they dont exist when saving a buffer to a file
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local filepath = vim.fn.expand("<afile>")
    local dir = vim.fn.fnamemodify(filepath, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})