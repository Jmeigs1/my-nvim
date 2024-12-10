local enabled = false

if not enabled then
  return {}
end

return {
  "nvim-cmp",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function(_, opts)
    for key, value in pairs(opts.sources) do
      if value.name == "luasnip" then
        table.remove(opts.sources, key)
        table.insert(opts.sources, 1, { name = "luasnip", group_index = 0 })
        break
      end
    end
    return opts
  end,
}
