local config = {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      inlay_hints = { enabled = false },
    })
  end,
}

return config
