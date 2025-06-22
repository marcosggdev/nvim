local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  -- language servers for nuxt stack
  local servers = { "volar", "ts_ls", "html", "cssls" }
  for _, server in ipairs(servers) do
    if lspconfig[server] and type(lspconfig[server].setup) == "function" then
      lspconfig[server].setup({})
    else
      print("Warning: LSP server '" .. server .. "' not available")
    end
  end
end

return M



