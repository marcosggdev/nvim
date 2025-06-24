local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local capabilities = cmp_nvim_lsp.default_capabilities()

  lspconfig.volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    capabilities = capabilities,
  })

  lspconfig.ts_ls.setup({
    capabilities = capabilities,
  })

  lspconfig.html.setup({ capabilities = capabilities })
  lspconfig.cssls.setup({ capabilities = capabilities })
end

return M




