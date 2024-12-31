return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "config" .. "/lua",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy", "${3rd}/luv/library",
        },
      },
    },
  },
}
