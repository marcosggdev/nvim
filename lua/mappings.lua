local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NvimTreeToggle
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts) -- Abrir/cerrar NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- Abrir/cerrar NvimTree
map('n', '<Leader>f', ':Telescope find_files<CR>', opts) -- Buscar archivos

-- toggleterm ctrl +
map("n", "<Leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Buscar archivos"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Buscar texto en proyecto"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Listar buffers abiertos"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Buscar en ayuda de Vim"})

