local set = vim.opt

-- General Vim configs
set.number = true          
set.relativenumber = false  
set.tabstop = 2        
set.shiftwidth = 2          
set.expandtab = true 
set.softtabstop = 2       
set.clipboard = 'unnamedplus' 
set.termguicolors = true
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#FFFFFF", bg = "#1E1E1E" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#888888", bg = "#1E1E1E" })



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

