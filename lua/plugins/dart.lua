return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {
          -- Optional: you can add custom config
          settings = {
            dart = {
              completeFunctionCalls = true,
              showTodos = true,
            },
          },
        },
      },
    },
  },
}
