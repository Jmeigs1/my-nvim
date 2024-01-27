return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    local icon = require("lazyvim.config").icons.kinds.TabNine
    table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("cmp_tabnine", icon))
    opts.sections.lualine_z = {
      function()
        return " " .. os.date("%I:%M:%S %p")
      end,
    }
  end,
}
