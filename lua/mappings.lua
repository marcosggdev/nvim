local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- NvimTreeToggle
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts) -- Abrir/cerrar NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- Abrir/cerrar NvimTree

-- toggleterm
map("n", "<Leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Look for files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Look for text in the project"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "List open buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Search at Vim help"})

