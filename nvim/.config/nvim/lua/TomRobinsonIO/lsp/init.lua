local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "TomRobinsonIO.lsp.lsp-installer"
require("TomRobinsonIO.lsp.handlers").setup()
require "TomRobinsonIO.lsp.null-ls"
