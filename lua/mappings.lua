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

-- LuaSnip
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  print("Trying to expand or jump")
  if ls.expand_or_jumpable() then
    print("Expanding snippet!")
    ls.expand_or_jump()
  else
    print("No snippet to expand or jump")
  end
end, { silent = false })


vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

