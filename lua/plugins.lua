return {

  --lspconfig -> provides ready to use configs for language servers 
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

  -- NvimTree -> Show directory structure
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Nice icons for files
    config = function()
      require("nvim-tree").setup({
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
      direction = "float",       -- could be "horizontal" or "vertical" too
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
    lazy = false,  -- Load at start (solves an error)
    priority = 1000, -- Load before other plugins (solves errors)
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Treesitter syntax highlights
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

  -- Autocomplete
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
          -- Prettier for JS
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescript = {
          -- Prettier for TS
          function()
            return {
              exe = "prettier",
              args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        vue = {
          -- Prettier for Vue
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

  {
    "mhinz/vim-startify",
    config = function()
      vim.g.startify_session_persistence = 1  -- save session automatically
    end
  },


  -- Telescope -> Powerfull file finder. Ignores .git, .node_modules, and some more directories
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
