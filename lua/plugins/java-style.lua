local code_style_file = "/Users/jacob.meigs/Work/styles/code-style.xml"

-- TODO: This doesn't work

local config = {
  "mfussenegger/nvim-jdtls",
  opts = {
    java = {
      format = {
        enabled = true,
        settings = {
          file = code_style_file,
          profile = "GoogleStyle",
        },
      },
    },
  },
}

return config
-- return {}
