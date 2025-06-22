local set = vim.opt

set.number = true           -- Mostrar números de línea
set.relativenumber = true   -- Números relativos
set.tabstop = 4             -- Tamaño del tabulador
set.shiftwidth = 4          -- Tamaño de la indentación
set.expandtab = true        -- Usar espacios en lugar de tabuladores
set.clipboard = 'unnamedplus' -- Sincronizar con el portapapeles del sistema
set.termguicolors = true    -- Habilitar colores 24 bits

-- === Configuración formatter.nvim ===
vim.cmd([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.ts,*.vue Format
    augroup END
]])


