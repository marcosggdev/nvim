return {
  { "neovim/nvim-lspconfig" }, -- tu LSP

  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- íconos bonitos para los archivos
    config = function()
      require("nvim-tree").setup({
        -- Aquí puedes poner tu configuración personalizada
        -- Por ejemplo:
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
        -- Otras opciones que quieras ajustar
      })
    end,
  },
  -- akinsho/toggleterm.nvim -> embedded cmd
  {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],  -- Ctrl + \
      shading_factor = 2,
      direction = "float",       -- también puede ser "horizontal" o "vertical"
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })
    end,
  },

  --folke/tokyonight.nvim -> theme
  {
    "folke/tokyonight.nvim",
    lazy = false,  -- para que se cargue al iniciar
    priority = 1000, -- para que se cargue antes que otros plugins
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configuración básica para volar (el servidor oficial para Vue 3 y TS)
      lspconfig.volar.setup({ 
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      })

      -- Otros servidores que te interesen
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
    end,
  },

  -- Treesitter para mejor resaltado
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "vue", "typescript", "javascript", "html", "css", "json" },
        highlight = { enable = true },
      })
    end,
  },

  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
  },

  -- Formatter
  {
    "mhartington/formatter.nvim",
    config = function()
    require('formatter').setup({
      logging = false,
      filetype = {
        javascript = {
          -- Usa prettier para JS
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescript = {
          -- También prettier para TS
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        vue = {
          -- prettier también sirve para Vue
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
      }
    })
    end
  },

  -- Auto session
  {
    "rmagatti/auto-session",
    config = function()
      local sessionoptions = vim.o.sessionoptions
      if sessionoptions == "" then
        vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
      elseif not sessionoptions:match("localoptions") then
        vim.o.sessionoptions = sessionoptions .. ",localoptions"
      end
      require("auto-session").setup {
        log_level = "info",
        auto_session_enable_last_session = true, -- carga la última sesión al abrir nvim
        auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
        auto_session_enabled = true,
      }
      end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    require('telescope').setup{
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob', '!.git/*',
          '--glob', '!node_modules/*',
          '--glob', '!.nuxt/*',
          '--glob', '!dist/*',
          '--glob', '!coverage/*',
          '--glob', '!logs/*',
        },
      },
    }
    end
  }
}
