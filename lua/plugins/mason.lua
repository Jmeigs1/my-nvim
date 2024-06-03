return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        ensure_installed = {
          "eslint-lsp@4.8.0",
        },
      },
    },
  },
}
