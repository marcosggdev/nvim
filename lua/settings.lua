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

-- Use a fixed directory in home for storing sessions
local home = vim.loop.os_homedir()
vim.g.startify_session_dir = home .. '/.config/nvim/sessions'

-- Open Startify when opening nvim with no files
vim.cmd([[
  autocmd VimEnter * if argc() == 0 | Startify | endif
]])

-- Ask to save session on exit
vim.cmd([[
  autocmd VimLeavePre * lua AskSaveSession()
]])

function AskSaveSession()
  local answer = vim.fn.input("Save session? (y/n): ")
  print("")  -- Print a blank line for spacing after input
  if answer:lower() == 'y' then
    -- Save session with the current folder name
    local folder_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    vim.cmd('SSave ' .. folder_name)
  end
end




