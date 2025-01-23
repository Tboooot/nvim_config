local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "pyright",    -- Python
    "html",       -- HTML
    "cssls",      -- CSS
    "lua_ls",     -- Lua
  },
  automatic_installation = true,
})

